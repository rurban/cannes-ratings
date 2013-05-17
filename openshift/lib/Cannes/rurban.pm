package Cannes::rurban;
use Dancer ':syntax';
use utf8;

our $VERSION = '0.1';
#our ($DATA,$HEADER,$FOOTER,@critics);
#our (%critic,%badcritic,%title,@t);

sub _read {
  my $DATA = shift;
  my $critics = shift;
  my %critic = %{$_[0]};
  my %title = %{$_[1]};
  my ($critic,$mag,$cn,$out,@t);
  for my $c (@{$critics}) {
    for (split/\n/,$c) { 
      undef $critic;
      if (/^(\S.+) \((.+), (.+)\)/) {
	($critic,$mag,$cn) = ($1, $2, $3);
      } elsif (/^(\S.+) \((.+)\)/) {
	($critic,$mag,$cn) = ($1,'',$2);
      }
      next unless $critic;
      $critic{$critic}->{cn} = $cn if $cn;
      $critic{$critic}->{mag} = $mag if $mag;
    }
  }
  my ($title_dir,$a,$n,$title,$s,$url);
  for (split /\n/, $DATA) { #chomp;
    if (/^#/) { next; }     #skip
    elsif (/^\s+(\S.*)/ and $title) { # film comments, links
      my $cmt = $1;
      $cmt =~ s{(http:\S+)}{<a href="$1">$1</a>};
      $title{$title}->{comment} = $cmt;
    } elsif (/^["“](.+)["”]/) {
      my $a = $n ? sprintf("%.02f", $s/$n) : 0;
      push @t, [$title_dir,$a,$n,$title] if $title_dir;
      $title = $1;
      s/[“”]/"/g; s/ \([\d.,]+\) \d+ votos//;
      $title_dir = $_; $n = $s = 0; 
    } elsif (/[\w\)]:? [-\x{2013} \t]*(\d[\d\.]*)(\s+http\S+)?/) {
      my $x = $1; $x =~ s/,/./g; $x = 10 if $x > 10; $x = 0 if $x < 0;
      $s += $x; $n++; undef $critic;
      $url = $2;
      $url =~ s/^\s+// if $url;
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
      $title{$title}->{review}->{$critic} = $url if $url;
      $critic{$critic}->{cn} = $cn if $cn;
      $critic{$critic}->{mag} = $mag if $mag;
    } elsif (/[\w\)] [-\x{2013} \t]*(http\S+)/) { # review link only
      undef $critic;
      $url = $1;
      if (/^(\S.+) \((.+), (\w+?)\)/) {
	($critic,$mag,$cn) = ($1, $2, $3);
      } elsif (/^(\S.+) \((.+)\)/) {
	($critic,$mag,$cn) = ($1,'',$2);
      } elsif (/^(\S[^\(]+)\s+(\d|http)/) {
	($critic,$mag,$cn) = ($1,'','');
	$critic =~ s/ +$//;
      }
      next unless $critic;
      $title{$title}->{critic}->{$critic} = [];
      $title{$title}->{review}->{$critic} = $url;
      $critic{$critic}->{cn} = $cn if $cn;
      $critic{$critic}->{mag} = $mag if $mag;
    }
  }
  return ( \%critic, \%title, \@t );
}

sub _detail {
  my $t = shift;
  my $h = shift;
  my $critic = shift;
  my $nostrike = shift;
  my $out = '';
  $out .= "<tr><td></td><td colspan=2 class=detail><i>&nbsp;&nbsp; - $h->{comment}</i></td>" if exists $h->{comment};

  for (sort {!defined $h->{critic}->{$b}->[0] ? -1
	       : !defined $h->{critic}->{$a}->[0] ? 1
	       : $h->{critic}->{$b}->[0] <=> $h->{critic}->{$a}->[0]}
       keys %{$h->{critic}}) {
    my $c = defined($h->{critic}->{$_}->[0]) ? $h->{critic}->{$_}->[0] : '';
    my $n = $_;
    if (substr($c,0,1) eq "-") {
      $n = "<strike>$n</strike>" unless $nostrike;
      $c = abs($c);
    }
    my $url = $h->{review}->{$_} if $_ and exists $h->{review}->{$_};
    if ($url) {
      $n = qq(<a href="$url">$n</a>);
      $c = qq(<a href="$url">$c</a>) if $c;
    }
    $n .= " ($critic->{$_}->{mag}, $critic->{$_}->{cn})" if $critic->{$_}->{mag};
    $out .= "<tr><td></td><td class=detail>&nbsp;&nbsp;$n</td>"
      ."<td class=detail>$c</td></tr>\n";
  }
  $out;
}

sub _critic_detail {
  my $n = shift;
  my $h = shift;
  my $out = '';
  for my $t (sort {$h->{title}->{$b}->[0] <=> $h->{title}->{$a}->[0]}
	     keys %{$h->{title}}) {
    my $f = $h->{title}->{$t};
    my $c = @$f == 3 ? sprintf("[ %s - %0.2f = %0.2f ]", @$f)
      : defined($f->[0])
        ? "[ ".$f->[0]." ]" 
        : "[-]";
    $out .= "<tr><td></td><td class=detail>&nbsp;&nbsp;$t</td>"
      ."<td class=detail>$c</td></tr>\n";
  }
  $out;
}
sub _show_detail {
  my $i = shift;
  my $t = params->{t} or return undef;;
  if (($t eq $i) || ($t eq '*')) { return 1; }
  else { return undef; }
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
    $l =~ s/ \[(.+?)\]//; my $section = $1;
    $section='Other' if !$section or !$sections{$section};
    $title{$t}->{'section'} = $section; 
    $title{$t}->{'avg'} = $a;
    $title{$t}->{'num'} = $n;
    $title{$t}->{'line'} = $l;
    for my $c (keys %{$title{$t}->{critic}}) {
      my $x = $title{$t}->{critic}->{$c}->[0];
      if (defined $x) {
        push @{$title{$t}->{critic}->{$c}}, $x - $a;
        push @{$critic{$c}->{title}->{$t}}, ($a, $x - $a);
      }
    }
  }
  my (%badcritic, @good, @allfilms);
  for my $c (keys %critic) {
    my ($s,$sum,$asum)=(0,0,0);
    my @k = keys(%{$critic{$c}->{title}});
    $critic{$c}->{stddev} = 0;
    unless (@k){delete $critic{$c};next};
    my $num = scalar(@k);
    for (@k) {
      my ($x,$a,$d) = @{$critic{$c}->{title}->{$_}};
      my $n = $title{$_}->{num};
      if ($n > 1) {
        $asum += abs($d) if $d;
        $sum  += $d if $d;
      } else {
        $num--;
      }
    }
    for (@k) {
      my $d = $critic{$c}->{title}->{$_}->[2] || 0;
      $s += ($d * $d);
    }
    $critic{$c}->{diff} = $sum / $num;
    $critic{$c}->{absdiff} = $asum / $num;
    $critic{$c}->{stddev}  = sqrt($s / $num);
    $badcritic{$c}++ if $critic{$c}->{stddev} >= 2.5; 
  }
  # remove critics from %title if critics->stddev > 2.5.
  # we could strike out the best and worst per film, but better strike out off-critics
  # See http://www.facebook.com/note.php?note_id=10150174713060012
  for my $c (keys %badcritic) {
    for my $t (keys %title) {
      if ($title{$t}->{critic}->{$c}) {
        $title{$t}->{num}--; my ($n,$sum)=($title{$t}->{num},0);
        my $bak = $title{$t}->{critic}->{$c}->[0];
	delete $title{$t}->{critic}->{$c};
	for (keys %{$title{$t}->{critic}}) {
          my $n = $title{$t}->{critic}->{$_}->[0] if exists $title{$t}->{critic}->{$_};
	  $sum += $n if $n and $n > 0;
	}
	$title{$t}->{avg} = $n ? $sum / $n : 0;
        $title{$t}->{critic}->{$c}->[0] = "-$bak" if $bak;
      }
    }
  }
  @t = sort {$title{$b->[3]}->{avg} <=> $title{$a->[3]}->{avg}} @t;
  my $i=1;
  for (@t) { 
    my $t = $_->[3]; 
    my ($a,$s)=($title{$t}->{avg},0);
    for (keys %{$title{$t}->{critic}}) {
      my $v = $title{$t}->{critic}->{$_}->[0];
      if (defined($v) and $v > 0) {
        $s += ($v-$a)*($v-$a);
      }
    }
    $title{$t}->{stddev} = $title{$t}->{num} ? sqrt($s / $title{$t}->{num}) : 0;
  }
  my $list = '';
  for (@t) { 
    my $t = $_->[3];
    my $n = $title{$t}->{num};
    my $a = sprintf("%0.2f",$title{$t}->{avg}); 
    next if $n<=3 or $a < 7.5; 
    my $l = $title{$t}->{line};
    my $s = sprintf("%0.1f",$title{$t}->{stddev});
    $l="<i>$l</i>" if $s>=2.0;
    $l="<b>$l</b>" if $title{$t}->{section} eq 'Competition';
    $l="<small>$l</small>" if $title{$t}->{num} < 10;
    $list .= sprintf("<tr><td>%2d.</td> <td>$l</td> <td>\[<a name=\"$i\" href=\"?t=$i#$i\">$a/$n&nbsp;$s</a>\]</td></tr>\n", $i);
    if (Dancer::SharedData->request and _show_detail($i)) {
      $list .= _detail($t,$title{$t},\%critic);
    }
    $i++;
  }
  my $h = "<h1><a name=\"verygood\"></a> Very Good Films (avg>7.5, n>3)</h1>\n<table>\n";
  my $out = $list ? $h . $list . "</table>\n\n" : '';
  $list = '';
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
    $list .= sprintf("<tr><td>%2d.</td> <td>$l</td> <td>\[<a name=\"$i\" href=\"?t=$i#$i\">$a/$n&nbsp;$s</a>\]</td></tr>\n", $i);
    if (Dancer::SharedData->request and _show_detail($i)) {
      $list .= _detail($t,$title{$t},\%critic);
    }
    $i++;
  }
  if ($list) {
    $out .= "<h1><a name=\"good\"></a>Good Films (avg>6, n>3)</h1>\n<table>\n"
	   . $list
	   . "</table>\n<small><i>The rest is below 6, unacceptable for Cannes.</i></small>\n";
  }
  $out .= "\n<h1>All official sections</h1>\n\n";
  my %section;
  for my $section (@sections) {
    my ($sum,$num) = (0,0); 
    my @titles = keys %title;
    for (@titles) {
      if ($title{$_}->{section} and $title{$_}->{section} eq $section) {
        $section{$section}->{$_} = [ $title{$_}->{avg}, $title{$_}->{num}, $title{$_}->{stddev} ];
        if ($title{$_}->{num}) {
	  $sum += $title{$_}->{avg}; 
	  $num++
	}
      }
    }
    if (1 or $num) {
      my $j=1; my $six=1;
      my $qsection = lc($section);
      $qsection =~ s/\W//g;
      $out .= $num
	? sprintf("<h2><a name=\"$qsection\"></a><b>$section [%0.2f/%d]</b></h2>\n<table>\n", $sum/$num, $num)
	: sprintf("<h2><a name=\"$qsection\"></a><b>$section</b></h2>\n<table>\n");
      for (sort 
	   {
	     !$section{$section}->{$b}->[1] ? -1
	       : !$section{$section}->{$a}->[1] ? 1
	       : $section{$section}->{$b}->[0] <=> $section{$section}->{$a}->[0]
	   }
	   keys %{$section{$section}})
      { 
	my $s=$section{$section}->{$_}->[2];
	$s=0 unless $s;
	my $l=$title{$_}->{line};
	$l=$s>=2.0?"<i>$l</i>":$l;
        $l="<small>$l</small>" if $title{$_}->{num} < 10;
        if ($six and $section{$section}->{$_}->[0] < 6) {
          $six=0;
	  $out .= "<tr><td colspan=3>";
	  $out .= "-"x25;
	  $out .= "</td></tr>\n";
	}
        my $ns = $section{$section}->{$_}->[1] 
          ? sprintf("%0.2f/%d&nbsp;%0.1f", @{$section{$section}->{$_}})
          : '-';
        my $detail = ($section{$section}->{$_}->[1] or $title{$_}->{comment})
          ? "[<a name=\"$i\" href=\"?t=$i#$i\">$ns</a>]"
          : "[$ns]";
        if ($section{$section}->{$_}->[1]) {
          $out .= sprintf("<tr><td>%2d.</td> <td>%s</td> <td>%s</td></tr>\n", $j++, $l, $detail);
        } elsif ($title{$_}->{comment}) {
	  $out .= "<tr><td> </td>    <td>$l</td> <td>$detail</td></tr>\n";
        } else {
	  $out .= "<tr><td> </td>    <td>$l</td> <td>[-]</td></tr>\n";
        }
        if (Dancer::SharedData->request and _show_detail($i)) {
          $out .= _detail($_,$title{$_},\%critic);
        }
	$i++;
      }
      $out .= "</table>\n\n";
    }
  }

  $out .= "\n<h1><a name=\"all\"></a>All films</h1>\n\nSorted by avg vote, unfiltered:\n<table>\n"; 
  my $j=1; my $six=1;
  for (sort 
       {
	 !$b->[2] ? -1
	 : !$a->[2] ? 1
	 : $b->[1] <=> $a->[1]
       } @t)
  {
    my ($l,$a,$n,$t) = @{$_};
    next unless $t;
    my $s = sprintf("%0.1f",$title{$t}->{stddev}?$title{$t}->{stddev}:0); 
    $l="<i>$l</i>" if $s>=2.0;
    if ($l =~ / \[Competition\]/) { 
      $l =~ s/ \[Competition\]//; $l="<b>$l</b>";
    } else { $l =~ s/ \[[\w ]+?\]//;}
    $l="<small>$l</small>" if $title{$t}->{num}<10;
    if ($six and $n and $a<6.0){
      $six=0;
      $out .= "<tr><td colspan=3>"; $out .= "-"x25; $out .= "</td></tr>\n";
    }
    $out .= $n 
      ? sprintf("<tr><td>%2d.</td> <td>$l</td> <td>\[<a name=\"$i\" href=\"?t=$i#$i\">$a/$n&nbsp;$s</a>\]</td></tr>\n",$j++)
      :"<tr><td> </td> <td>$l</td> <td>\[-\]</td></tr>\n";
    if (Dancer::SharedData->request and _show_detail($i)) {
      $out .= _detail($t,$title{$t},\%critic,1);
    }
    $i++;
  }

  my $numc = scalar(keys(%critic));
  $out .= sprintf "</table>\n\n<h1><a name=\"critics\"></a>%d/%d Critics</h1>\n\n",
                  $numc - scalar(keys(%badcritic)),$numc;
  $out .= "<i>filter stddev >2.5 from avg</i><br>\n";
  $out .= "<b title=\"stdev over all differences from the film avg to the critics rating.\">stddev</b> name (magazine, cn) numratings <i title=\"avg of the diffs from film avg to rating over all rated films of this critic.
* &gt:1.5 over-rater,
* &lt;-1.5 under-rater,
* -1.5 - 1.5 deviant ratings in boths directions. e.g. ceiling effect\">±diff</i>\n<table>\n";
  if ($numc) {
    for (sort 
	 {
	   !exists $critic{$a}->{stddev} ? 1
	     : !exists $critic{$b}->{stddev} ? -1 
	     : $critic{$a}->{stddev} <=> $critic{$b}->{stddev}
	 } keys %critic)
    {
      no warnings;
      my $n = scalar keys( %{$critic{$_}->{title} });
      next if !($n and $_);
      my $c = sprintf("%s (%s, %s)", $_, $critic{$_}->{mag}, $critic{$_}->{cn});
      $c = "<strike>$c</strike>" if $critic{$_}->{stddev} > 2.5;
      $c = "<small>$c</small>" if $n < 10;
      $out .= sprintf "<tr><td>%0.2f</td> <td>%s</td> <td><a name=\"$i\" href=\"?t=$i#$i\">%d&nbsp;<i>%+0.1f</i></a></td></tr>\n", $critic{$_}->{stddev}, $c, $n, $critic{$_}->{diff}; 
      if (Dancer::SharedData->request and _show_detail($i)) {
	$out .= _critic_detail($_,$critic{$_});
      }
      $i++;
      # print Dumper $critic{$_} if $critic{$_}->{stddev} > 4;
    }
  }
  $out .= "</table>";
  return {out => $out, 
	  good   => \@good, 
	  sections => \%sections, 
	  sectlist => \@sections, 
	  allfilms => \@allfilms,
	  t => \@t,
	  title   => \%title,
	  critic  => \%critic,
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
  my $vars = _dump( _read($DATA, \@critics, {}, {}) );
  $vars->{year} = $year;
  $vars->{HEADER} = $HEADER;
  $vars->{FOOTER} = $FOOTER;
  if ($DATA) {
    template 'index', $vars;
  } else {
    template 'notyet', $vars;
  }
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
get '/2013' => sub {
  _list(2013);
};
get '/all' => sub {
  my $vars = {}; my (@t, %critic, %title);
  for my $year (qw(2010 2011 2012 2013)) {
    no strict 'refs';
    eval "require Cannes::rurban::$year;" or die "invalid year $year";
    my $DATA = ${"Cannes::rurban::$year\::DATA"};
    my $HEADER = ${"Cannes::rurban::$year\::HEADER"};
    my $FOOTER = ${"Cannes::rurban::$year\::FOOTER"};
    my @critics = @{"Cannes::rurban::$year\::critics"};
    my @new = _read($DATA, \@critics, \%critic, \%title);
    %critic = %{$new[0]}; %title = %{$new[1]};
    push @t, @{$new[2]};
    $vars->{year} = $year;
    $vars->{HEADER} = $HEADER;
    $vars->{FOOTER} = $FOOTER;
  }
  my $all = _dump( \%critic, \%title, \@t);
  $all->{year} = "2010-2012";
  template 'index', $all;
};
get '/' => sub {
  redirect '/2013';
};

1;
