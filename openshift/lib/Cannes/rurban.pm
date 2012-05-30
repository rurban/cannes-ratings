package Cannes::rurban;
use Dancer ':syntax';
use utf8;

our $VERSION = '0.1';
#our ($DATA,$HEADER,$FOOTER,@critics);
#our (%critic,%badcritic,%title,@t);

sub _read {
  my $DATA = shift;
  my @critics = @{$_[0]};
  my (%critic,$critic,$mag,$cn,$out,@t,%title);
  for my $c (@critics) {
    for (split/\n/,$c) { 
      undef $critic;
      if (/^(\S.+) \((.+), (.+?)\)/) {
	($critic,$mag,$cn) = ($1, $2, $3);
      } elsif (/^(\S.+) \((.+)\)/) {
	($critic,$mag,$cn) = ($1,'',$2);
      }
      next unless $critic;
      $critic{$critic}->{cn} = $cn if $cn;
      $critic{$critic}->{mag} = $mag if $mag;
    }
  }
  my ($title_dir,$a,$n,$title,$s);
  for (split /\n/, $DATA) { #chomp;
    if (/^#/) { next; } #skip
    elsif (/^["“](.+)["”]/) {
      my $a = $n ? sprintf("%.02f", $s/$n) : 0;
      push @t, [$title_dir,$a,$n,$title] if $title_dir;
      $title = $1;
      s/[“”]/"/g; s/ \([\d.,]+\) \d+ votos//;
      $title_dir = $_; $n = $s = 0; 
    } elsif (/[\w\)]:? [-\x{2013} ]*(\d[\d.]*)/) {
      my $x = $1; $x =~ s/,/./g; $x = 10 if $x > 10; $x = 0 if $x < 0;
      $s += $x; $n++; undef $critic;
      if (/^(\S.+) \((.+), (.+?)\)/) {
	($critic,$mag,$cn) = ($1, $2, $3);
      } elsif (/^(\S.+) \((.+)\)/) {
	($critic,$mag,$cn) = ($1,'',$2);
      } elsif (/^(\S[^\(]+)\s+\d/) {
	($critic,$mag,$cn) = ($1,'','');
	$critic =~ s/ +$//;
      }
      next unless $critic;
      $critic{$critic}->{title}->{$title} = [$x];
      $title{$title}->{critic}->{$critic} = [$x];
      $critic{$critic}->{cn} = $cn ? $cn : '';
      $critic{$critic}->{mag} = $mag ? $mag : '';
    }
  }
  return ( \%critic, \%title, \@t );
}

sub _dump {
  my %critic = %{$_[0]};
  my %title  = %{$_[1]};
  my @t = @{$_[2]};
  my @all = @t;
  my @sections = ("Competition", "Un Certain Regard", "Semaine", "Quinzaine", "Other");
  my %sections = map{$_=>1} @sections;
  @t = sort {$b->[1] <=> $a->[1]} @t;
  for (@t) {
    my ($l,$a,$n,$t) = @{$_}; 
    my $section;
    if ($l =~ / [\[\(]Competition[\]\)]/) { 
      $l =~ s/ [\[\(]Competition[\]\)]//; $section = 'Competition';
    } else { 
      $l =~ s/ [\[\(]([\w ]+?)[\]\)]//; $section = $1;
    }
    $section='Other' if !$section or !$sections{$section};
    $title{$t}->{'section'} = $section; 
    $title{$t}->{'avg'} = $a;
    $title{$t}->{'num'} = $n;
    $title{$t}->{'line'} = $l;
    for my $c (keys %{$title{$t}->{critic}}) {
      my $x = $title{$t}->{critic}->{$c}->[0];
      push @{$title{$t}->{critic}->{$c}}, $x - $a;
      push @{$critic{$c}->{title}->{$t}}, ($a, $x - $a);
    }
  }
  my (%badcritic, @good, @allfilms);
  for my $c (keys %critic) {
    my ($s,$sum,$asum)=(0,0,0);
    my @k = keys(%{$critic{$c}->{title}});
    unless (@k){delete $critic{$c};next};
    for (@k) {
      my ($x,$a,$d) = @{$critic{$c}->{title}->{$_}};
      $asum += abs($d) if $d;
      $sum  += $d if $d;
    }
    for (@k) {
      my $d = $critic{$c}->{title}->{$_}->[2] || 0;
      $s += ($d * $d);
    }
    $critic{$c}->{diff} = $sum / scalar(@k);
    $critic{$c}->{absdiff} = $asum / scalar(@k);
    $critic{$c}->{stddev}  = sqrt($s / scalar(@k));
    $badcritic{$c}++ if $critic{$c}->{stddev} >= 2.5; 
  }
  # remove critics from %title if critics->stddev > 2.5.
  # we could strike out the best and worst per film, but better strike out off-critics
  # See http://www.facebook.com/note.php?note_id=10150174713060012
  for my $c (keys %badcritic) {
    for my $t (keys %title) {
      if ($title{$t}->{critic}->{$c}) {
        $title{$t}->{num}--; my ($n,$sum)=($title{$t}->{num},0);
	delete $title{$t}->{critic}->{$c};
	for (keys %{$title{$t}->{critic}}) {
	  $sum += $title{$t}->{critic}->{$_}->[0];
	}
	$title{$t}->{avg} = $n ? $sum / $n : 0;
      }
    }
  }
  @t = sort {$title{$b->[3]}->{avg} <=> $title{$a->[3]}->{avg}} @t;
  my $i=1;
  for (@t) { 
    my $t = $_->[3]; 
    my ($a,$s)=($title{$t}->{avg},0);
    for (keys %{$title{$t}->{critic}}) {
      my $v=$title{$t}->{critic}->{$_}->[0]; 
      $s += ($v-$a)*($v-$a);
    }
    $title{$t}->{stddev} = $title{$t}->{num} ? sqrt($s / $title{$t}->{num}) : 0;
  }
  my $out = "<h1>Very Good Films (avg>7.5, n>3)</h1>\n<pre>\n";
  for (@t) { 
    my $t = $_->[3];
    my $n=$title{$t}->{num};
    my $a = sprintf("%0.2f",$title{$t}->{avg}); 
    next if $n<=3 or $a < 7.5; 
    my $l=$title{$t}->{line};
    my $s=sprintf("%0.1f",$title{$t}->{stddev});
    $l="<i>$l</i>" if $s>=2.0;
    $l="<b>$l</b>" if $title{$t}->{section} eq 'Competition';
    $l="<small>$l</small>" if $title{$t}->{num} < 10;
    $out .= sprintf("%2d. $l \[$a/$n $s\]\n", $i++);
  }
  $out .= "</pre>\n\n<h1>Good Films (avg>6, n>3)</h1>\n<pre>\n";
  for (@t) { 
    my $t = $_->[3];
    my $a=sprintf("%0.2f",$title{$t}->{avg}); 
    my $n=$title{$t}->{num}; 
    next if $a < 6.0 or $a >= 7.5 or $n <= 3; 
    my $l=$title{$t}->{line};
    my $s=sprintf("%0.1f",$title{$t}->{stddev});
    $l="<i>$l</i>" if $s>=2.0;
    $l="<b>$l</b>" if $title{$t}->{section} eq 'Competition';
    $l="<small>$l</small>" if $title{$t}->{num} < 10;
    $out .= sprintf "%2d. $l \[$a/$n $s\]\n", $i++; 
  }
  $out .= "</pre>\nThe rest is below 6, unacceptable for Cannes.\n";

  $out .= "\n<h1>All official sections</h1>\n\n";
  my %section;
  for my $section (@sections) {
    my ($sum,$num) = (0,0); 
    my @titles = keys %title;
    for (@titles) {
      if ($title{$_}->{section} and $title{$_}->{section} eq $section) {
        $section{$section}->{$_} = [ $title{$_}->{avg}, $title{$_}->{num}, $title{$_}->{stddev} ];
        if($title{$_}->{num}) {
	  $sum += $title{$_}->{avg}; 
	  $num++
	}
      }
    }
    if ($num) { my $i=1; my $six=1;
      $out .= sprintf("<h2>Ratings for <b>$section [%0.2f/%d]</b></h2>\n<pre>\n", $sum/$num, $num);
      for (sort {$section{$section}->{$b}->[0] <=> $section{$section}->{$a}->[0]}
	   keys %{$section{$section}}) 
      { 
	my $s=$section{$section}->{$_}->[2];
	$s=0 unless $s;
	my $l=$title{$_}->{line};
	$l=$s>=2.0?"<i>$l</i>":$l;
        $l="<small>$l</small>" if $title{$_}->{num} < 10;
        if ($six and $section{$section}->{$_}->[0] < 6){
          $six=0; 
	  $out .= "-"x25;
	  $out .= "\n";
	}
        $out .= $section{$section}->{$_}->[1] 
	  ? sprintf("%2d. %s [%0.2f/%d %0.1f]\n", 
		    $i++, $l, @{$section{$section}->{$_}}) 
	  : sprintf("    $l [-]\n");
      }
      $out .= "</pre>\n\n"; 
    }
  }

  $out .= "\n<h1>All films</h1>\n\nSorted by avg vote, unfiltered:\n<pre>\n"; 
  $i=1; my $six=1;
  for (sort {$b->[1] <=> $a->[1]} @t) {
    my ($l,$a,$n,$t) = @{$_};
    next unless $t;
    my $s = sprintf("%0.1f",$title{$t}->{stddev}?$title{$t}->{stddev}:0); 
    $l="<i>$l</i>" if $s>=2.0;
    if ($l =~ / \[Competition\]/) { $l =~ s/ \[Competition\]//; $l="<b>$l</b>"; }
    else { $l =~ s/ \[[\w ]+?\]//;}
    $l="<small>$l</small>" if $title{$t}->{num}<10;
    if ($six and $n and $a<6.0){$six=0;print "-"x25,"\n"}
    $out .= $n ? sprintf("%2d. $l \[$a/$n $s\]\n",$i++):"    $l \[-\]\n";
  }

  my $numc = scalar(keys(%critic));
  $out .= sprintf "</pre>\n\n<h1>%d/%d Critics</h1>\n\n",
                  $numc - scalar(keys(%badcritic)),$numc;
  $out .= "<i>filter stddev >2.5 from avg</i>\n";
  $out .= "stddev name (magazine, cn) numratings <i>±diff</i>\n<pre>\n";
  for (sort {$critic{$a}->{stddev} <=> $critic{$b}->{stddev}} keys %critic) {
    no warnings;
    my $n = scalar keys( %{$critic{$_}->{title} });
    next if !($n and $_);
    my $c = sprintf("%s (%s, %s)", $_, $critic{$_}->{mag}, $critic{$_}->{cn});
    $c = "<strike>$c</strike>" if $critic{$_}->{stddev} > 2.5;
    $c = "<small>$c</small>" if $n < 10;
    $out .= sprintf "%0.2f %s %d <i>%+0.1f</i>\n", 
                    $critic{$_}->{stddev}, $c, $n, $critic{$_}->{diff}; 
    # print Dumper $critic{$_} if $critic{$_}->{stddev} > 4;
  }
  $out .= "</pre>";
  return {out => $out, 
	  good   => \@good, 
	  sections => \%sections, 
	  sectlist => \@sections, 
	  allfilms => \@allfilms,
	  t => \@t,
	  title   => \%title,
	  critics => \%critic,
	  numc => $numc, 
	  numb => scalar(keys(%badcritic))
  };
}

sub _list {
  my $year = shift;
  no strict 'refs';
  eval "require Cannes::rurban::$year;" or die "invalid year $year";
  my $DATA = ${"Cannes::rurban::$year\::DATA"};
  my $HEADER = ${"Cannes::rurban::$year\::HEADER"};
  my $FOOTER = ${"Cannes::rurban::$year\::FOOTER"};
  my @critics = @{"Cannes::rurban::$year\::critics"};
  my $vars = _dump( _read($DATA, \@critics) );
  $vars->{year} = $year;
  $vars->{HEADER} = $HEADER;
  $vars->{FOOTER} = $FOOTER;
  template 'index', $vars;
}

get '/2010' => sub {
  _list(2010);
};
get '/2011' => sub {
  _list(2011);
};
get '/2012' => sub {
  _list(2012);
};
get '/all' => sub {
  my $vars = {};
  for my $year (qw(2010 2011 2012)) {
    no strict 'refs';
    eval "require Cannes::rurban::$year;" or die "invalid year $year";
    my $DATA = ${"Cannes::rurban::$year\::DATA"};
    my $HEADER = ${"Cannes::rurban::$year\::HEADER"};
    my $FOOTER = ${"Cannes::rurban::$year\::FOOTER"};
    my @critics = @{"Cannes::rurban::$year\::critics"};
    $vars = _dump( _read($DATA, \@critics) );
    $vars->{year} = $year;
    $vars->{HEADER} = $HEADER;
    $vars->{FOOTER} = $FOOTER;
  }
  template 'index', $vars;
};
get '/' => sub {
  _list(2012);
};

1;
