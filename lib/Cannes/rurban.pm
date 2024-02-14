package Cannes::rurban;
use Dancer ':syntax';
use File::Basename ();
use HTTP::Date ();
use utf8;

our $VERSION = '0.2';
our $BASE = 'Cannes';
our @YEARS = (2010..2023);
our $comp_section = 'Competition';
our @sections = ($comp_section, "Un Certain Regard", "Out Of Competition", "Quinzaine", 
                 "Semaine", "ACID", "Other"); #, "Predictions"

sub us_rating {
  my $r = {'A+' => 10,  'A' => 9,   'A-' => 8, 
           'B+' => 7,   'B' => 6,   'B-' => 5,
           'C+' => 4,   'C' => 3,   'C-' => 2, 
           'D+' => 1.5, 'D' => 1,   'D-' => 1, 
           'E+' => 0.5, 'E' => 0.5, 'E-' => 0.5, 
           'F+' => 0,   'F' => 0,   'F-' => 0};
  return $r->{$_[0]};
}

sub _read {
  my $DATA = shift;
  my $critics = shift;
  my %critic = %{$_[0]};
  my %title = %{$_[1]};
  my @critics_group = @{$_[2]};
  my ($critic,$mag,$cn,$out,@t);
  my $i = 0;
  for my $c (@{$critics}) {
    for (split/\n/,$c) {
      undef $critic;
      if (/^(\S.+) \((.+), (.+?)\)/) {
	($critic,$mag,$cn) = ($1, $2, $3);
      } elsif (/^(\S.+) \((.+?)\)/) {
        if (length($2) > 3) {
          ($critic,$mag,$cn) = ($1,$2,'');
        } else {
          ($critic,$mag,$cn) = ($1,'',$2);
        }
      } else {
        ($critic,$mag,$cn) = ($_,'','');
      }
      next unless $critic;
      $critic =~ s/\s+$//;
      $critic{$critic}->{cn}  = $cn if $cn;
      $critic{$critic}->{mag} = $mag if $mag;
      $critic{$critic}->{group} = $critics_group[$i];
    }
    $i++;
  }
  my ($title_dir,$a,$n,$title,$s,$url);
  for (split /\n/, $DATA) { #chomp;
    if (/^#/) { next; }     #skip
    elsif (/^\s+(\S.*)/ and $title) { # film comments, links
      my $cmt = $1;
      $cmt =~ s{(http\S+)}{<a href="$1">$1</a>};
      $title{$title}->{comment} = $cmt unless $title{$title}->{comment};
    } elsif (/^["“](.+)["”]/) {
      my $a = $n ? sprintf("%.02f", $s/$n) : 0;
      push @t, [$title_dir,$a,$n,$title] if $title_dir;
      $title = $1;
      s/[“”]/"/g; s/ \([\d.,]+\) \d+ votos//;
      $title_dir = $_; $n = $s = 0; 
    } elsif ($title and /\w[\w\)\.]:?[\x{2013} \t]+(\d+?|\d\.\d+|[ABCDEF][\+\-]?)(\s+.*)?$/) {
      my $x = $1; $url = $2;
      $x = us_rating($x) if $x =~ /^[ABCDEF]/;
      $x =~ s/,/./g;
      if ($x =~ /^[0-9.]*$/) {
        $x = 10 if $x > 10;
        $x = 0 if $x < 0;
      } else {
        $x = 0;
      }
      undef $critic;
      $url =~ s/^\s+// if $url;
      undef $url if $url and $url !~ /^http/;
      if (/^(\S.+) \((.+), (.+?)\)/) {
	($critic,$mag,$cn) = ($1, $2, $3);
      } elsif (/^(\S.+) \((.+)\)/) {
	($critic,$mag,$cn) = ($1,'',$2);
      } elsif (/^(\S[^\(]+) \s+ (\d[\d\.]* | [ABCDEF][\+\-]?)/x) {
	($critic,$mag,$cn) = ($1,'','');
	$critic =~ s/ +$//;
      }
      next unless $critic;
      $s += $x; $n++;
      $critic =~ s/\s+$//;
      $critic{$critic}->{title}->{$title} = [$x];
      $title{$title}->{critic}->{$critic} = [$x];
      $title{$title}->{review}->{$critic} = $url if $url;
      $critic{$critic}->{cn} = $cn if $cn && !$critic{$critic}->{cn};
      $critic{$critic}->{mag} = $mag if $mag && !$critic{$critic}->{mag};
      if (    !exists $critic{$critic}->{mag}
          and !exists $critic{$critic}->{cn}
          and !exists $critic{$critic}->{group}) {
        $critic{$critic}->{group} = $critics_group[$#critics_group]; # letterboxd
      }
    } elsif ($title and /\w[\w\)][-\x{2013}\s]+(http\S+)/) { # review link only
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
      $critic =~ s/\s+$//;
      $title{$title}->{critic}->{$critic} = [] unless $title{$title}->{critic}->{$critic};
      $title{$title}->{review}->{$critic} = $url;
      $critic{$critic}->{cn} = $cn if $cn && !$critic{$critic}->{cn};
      $critic{$critic}->{mag} = $mag if $mag && !$critic{$critic}->{mag};
    }
  }
  $a = $n ? sprintf("%.02f", $s/$n) : 0;
  push @t, [$title_dir,$a,$n,$title] if $title_dir;
  return ( \%critic, \%title, \@t );
}
# boolean: show details for indexed t? (movie or critic)
sub _show_detail {
  my $i = shift;
  Dancer::SharedData->request or return undef;
  my $t = params->{t} or return undef;;
  if (($t eq $i) || ($t eq '*')) { return $t; }
  else { return undef; }
}
# show detail for one movie (?t=)
sub _detail {
  my $t = shift;
  my $h = shift;
  my $critic = shift;
  my $nostrike = shift;
  no warnings;
  my $out = '';
  $out .= "<tr><td></td><td colspan=2 class=detail><i>&nbsp;&nbsp; - $h->{comment}"
         ."</i></td></tr>\n"
    if exists $h->{comment};

  if (params->{debug}) {
    require Data::Dumper;
    my $x = $h;
    #delete $x->{review};
    $out .= "<tr><td colspan=3><code>".Data::Dumper::Dumper($x);
    for (keys %{$x->{critic}}) {
      $out .= ($_."=>".$x->{critic}->{$_}->[0]."<br>\n") 
	if $x->{critic}->{$_}->[0] and $x->{critic}->{$_}->[0] > 0;
    }
    $out .= "</code></tr>\n";
  }
  # sort reviews first, then ratings, then name
  for (sort {(!defined $h->{critic}->{$a}->[0] ? 
               ( !defined $h->{critic}->{$b}->[0] ? $a cmp $b : -1)
              : !defined $h->{critic}->{$b}->[0] ? 1
              : $h->{critic}->{$b}->[0] <=> $h->{critic}->{$a}->[0])
	      || ($a cmp $b) }
       keys %{$h->{critic}}) {
    my $c = defined($h->{critic}->{$_}->[0]) ? $h->{critic}->{$_}->[0] : '';
    my $n = $_;
    if ($n) {
      if (substr($c,0,1) eq "-") {
        $n = "<strike>$n</strike>" unless $nostrike;
        $c = abs($c);
      }
      my $url = $h->{review}->{$_} if $_ and exists $h->{review}->{$_};
      if ($critic->{$_}->{mag}) {
        $n .= " ($critic->{$_}->{mag}, $critic->{$_}->{cn})";
      } elsif ($critic->{$_}->{cn}) {
        $n .= " ($critic->{$_}->{cn})";
      }
      if ($url) {
        $n = qq(<a href="$url">$n</a>);
        $c = qq(<a href="$url">$c</a>) if $c;
      }
    }
    $out .= "<tr><td></td><td class=detail>&nbsp;&nbsp;$n</td>"
      ."<td class=detail>$c</td></tr>\n";
  }
  $out;
}
# show detail for one critic (?t=i)
sub _critic_detail {
  my $n = shift;
  my $h = shift;
  my $out = '';
  for my $t (sort {$h->{title}->{$b}->[0] <=> $h->{title}->{$a}->[0]}
	     keys %{$h->{title}}) {
    my $f = $h->{title}->{$t};
    my $c = @$f == 3 ? sprintf("[&nbsp;%s&nbsp;-&nbsp;%0.2f&nbsp;=&nbsp;%0.2f&nbsp;]", @$f)
      : defined($f->[0])
        ? "[&nbsp;".$f->[0]."&nbsp;]" 
        : "[-]";
    $out .= "<tr><td></td><td class=detail>&nbsp;&nbsp;$t</td>"
      ."<td class=detail>$c</td></tr>\n";
  }
  $out;
}

sub _dump {
  my %critic = %{$_[0]};
  my %title  = %{$_[1]};
  my @t = @{$_[2]};
  my $year = $_[3];
  my @all = @t;
  my $section;
  my %sections = map {$_=>1} @sections;

  @t = sort { $b->[1] <=> $a->[1] || $b->[0] cmp $a->[0] } @t;
  for (@t) {
    my ($l,$a,$n,$t) = @{$_};
    $section = '';
    if ($l =~ m/ \[(.+?)\]/) {
      $section = $1;
      if ((!$section or !$sections{$section}) and $section ne 'Predictions') {
        $section='Other'; # or Predicted?
      }
    }
    $title{$t}->{section} = $section;
    $title{$t}->{avg} = $a;
    $title{$t}->{num} = $n;
    $l =~ s/ \[(.+?)\]//;
    $title{$t}->{line} = $l;
    for my $c (sort keys %{$title{$t}->{critic}}) {
      my $x = $title{$t}->{critic}->{$c}->[0];
      if (defined $x) {
        push @{$title{$t}->{critic}->{$c}}, $x - $a;
        push @{$critic{$c}->{title}->{$t}}, ($a, $x - $a);
      }
    }
  }
  my (%badcritic, @good, @allfilms);
  my (%params_cn, $params_cn);
  if (Dancer::SharedData->request and params->{cn}) {
    $params_cn = ref(params->{cn}) eq 'ARRAY' ? params->{cn} : [ params->{cn} ];
    $params_cn{$_}++ for (@$params_cn);
  }
  my (%params_g, $params_g);
  if (Dancer::SharedData->request and params->{g}) {
    $params_g = ref(params->{g}) eq 'ARRAY' ? params->{g} : [ params->{g} ];
    $params_g{$_}++ for (@$params_g);
  }
  for my $c (keys %critic) {
    my ($s,$sum,$asum)=(0,0,0);
    my @k = keys(%{$critic{$c}->{title}});
    $critic{$c}->{stddev} = 0;
    next unless @k;
    my $num = scalar(@k);
    for (@k) {
      my ($x,$a,$d) = @{$critic{$c}->{title}->{$_}};
      my $n = $title{$_}->{num};
      if ($n and $n > 1) {
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
    if ($num) {
      $critic{$c}->{diff} = $sum / $num;
      $critic{$c}->{absdiff} = $asum / $num;
      $critic{$c}->{stddev}  = sqrt($s / $num);
    }
    $badcritic{$c}++ if $critic{$c}->{stddev} >= 2.5
      and $c !~ /^(IMDB|Letterbox|Letterboxd|Cannes|Sundance) \d/;
    if ( %params_cn and $critic{$c}->{cn} ) {
      $badcritic{$c}++ unless exists($params_cn{$critic{$c}->{cn}});
    }
    if ( %params_g and $critic{$c}->{group} ) {
      $badcritic{$c}++ unless exists($params_g{$critic{$c}->{group}});
    }
  }
  # include the badcritic ratings for the title stddev
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
  # remove critics from %title if critics->stddev > 2.5.
  # we could strike out the best and worst per film, but better strike out off-critics
  # See http://www.facebook.com/note.php?note_id=10150174713060012
  for my $c (keys %badcritic) {
    for my $t (keys %title) {
      if ($title{$t}->{critic}->{$c}) {
        #$title{$t}->{num}--;
        my $bak = $title{$t}->{critic}->{$c}->[0];
	delete $title{$t}->{critic}->{$c};
	$title{$t}->{numcritics} = scalar keys %{$title{$t}->{critic}};
	$title{$t}->{numreviews} = scalar keys %{$title{$t}->{review}};
	my ($n,$sum)=(0,0);
	for (keys %{$title{$t}->{critic}}) {
	  if (exists $title{$t}->{critic}->{$_}) {
	    my $r = $title{$t}->{critic}->{$_}->[0];
	    if ($r and $r >= 0) {
	      $sum += $r;
	      $n++;
	    }
	  }
	}
	$title{$t}->{num} = $n;
	$title{$t}->{avg} = $n ? $sum / $n : 0;
        $title{$t}->{critic}->{$c}->[0] = "-$bak" if $bak;
      }
    }
  }
  @t = sort {
    $title{$b->[3]}->{avg} <=> $title{$a->[3]}->{avg}
    || $a->[3] cmp $b->[3]
  } @t;
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
  # Very Good New Films
  for (@t) { 
    my $t = $_->[3];
    my $n = $title{$t}->{num};
    my $a = sprintf("%0.2f",$title{$t}->{avg}); 
    next if $n<=3 or $a < 7.5; 
    my $l = $title{$t}->{line};
    next if $title{$t}->{section} =~ /^(Retrospektive)$/;
    next if $l =~ / 19\d\d\)/;
    next if $l =~ / 200\d\)/;
    next if $l =~ m{</i>$}; # other festivals
    my ($lyear) = $l =~ / (20\d\d)\)/;
    if ($lyear) {
      next if $year - $lyear > 1;
      # in the 2 New sections skip old films with prev:
      next if grep /^(IMDB|Letterbox|Letterboxd|Cannes|Sundance) \d/,
        keys %{$title{$t}->{critic}};
    }
    my $s = sprintf("%0.1f",$title{$t}->{stddev});
    $l="<i>$l</i>" if $s >= 2.0;
    $l="<b>$l</b>" if $title{$t}->{section} eq $comp_section;
    $l="<small>$l</small>" if $title{$t}->{num} < 10;
    $list .= sprintf("<tr><td>%2d.</td> <td>$l</td> <td class=r>\[<a name=\"$i\" href=\"?t=$i#$i\">$a/$n&nbsp;$s</a>\]</td></tr>\n", $i);
    if (_show_detail($i)) {
      $list .= _detail($t,$title{$t},\%critic);
    }
    $i++;
  }
  my $h = "<h1 title=\"(avg>7.5, n>3)\"><a name=\"verygood\"></a> Very Good New Films</h1>\n<table>\n";
  my $out = $list ? $h . $list . "</table>\n\n" : '';
  if (@sections == 1) {
    $out = '';
  }
  $list = '';
  for (@t) {
    my $t = $_->[3];
    my $a=sprintf("%0.2f",$title{$t}->{avg});
    my $n=$title{$t}->{num}; 
    next if $a < 6.0 or $a >= 7.5 or $n <= 3; 
    my $l=$title{$t}->{line};
    next if $title{$t}->{section} =~ /^(Retrospektive)$/;
    next if $l =~ / 19\d\d\)/;
    next if $l =~ / 200\d\)/;
    next if $l =~ m{</i>$}; # other festivals
    my ($lyear) = $l =~ / (20\d\d)\)/;
    if ($lyear and $year) {
      next if $year - $lyear > 1;
      # in the 2 New sections skip old films with prev:
      next if grep /^(IMDB|Letterbox|Letterboxd|Cannes|Sundance) \d/,
        keys %{$title{$t}->{critic}};
    }
    my $s=sprintf("%0.1f",$title{$t}->{stddev});
    $l="<i>$l</i>" if $s>=2.0;
    $l="<b>$l</b>" if $title{$t}->{section} eq $comp_section;
    $l="<small>$l</small>" if $title{$t}->{num} < 10;
    $list .= sprintf("<tr><td>%2d.</td> <td>$l</td> <td class=r>\[<a name=\"$i\" href=\"?t=$i#$i\">$a/$n&nbsp;$s</a>\]</td></tr>\n", $i);
    if (_show_detail($i)) {
      $list .= _detail($t,$title{$t},\%critic);
    }
    $i++;
  }
  if ($list and @sections != 1) {
    $out .= "<h1 title=\"(avg>6, n>3)\"><a name=\"good\"></a>Good New Films</h1>\n<table>\n"
	   . $list
	   . "</table><br />\n<small><i>&nbsp;&nbsp;&nbsp;The rest is below 6 or is not new or has not enough votes.</i></small>\n";
  }
  if (@sections != 1) {
    $out .= "\n<h1>All official sections</h1>\n\n";
  }
  my ($allreviews, $numratings) = (0,0);
  my %section;
  for my $section (@sections) {
    my ($sum,$num) = (0,0); 
    my @titles = keys %title;
    for (@titles) {
      if ($title{$_}->{section} and $title{$_}->{section} eq $section) {
        my $numreviews = scalar keys %{$title{$_}->{review}};
        $allreviews += $numreviews;
        $section{$section}->{$_} = [ $title{$_}->{avg}, $title{$_}->{num},
                                     $title{$_}->{stddev}, $numreviews ];
        if ($title{$_}->{num}) {
	  $sum += $title{$_}->{avg}; 
	  $num++;
	}
      }
    }
    if ($num || 1) { #|| $section eq 'Other') {
      my $j=1; my $six=1;
      my $qsection = lc($section);
      $qsection =~ s/\W//g;
      $out .= $num
      	? sprintf("<h2><a name=\"$qsection\"></a><b>$section [%0.2f/%d]</b></h2>\n<table>\n", $sum/$num, $num)
      	: sprintf("<h2><a name=\"$qsection\"></a><b>$section</b></h2>\n<table>\n");
      my $sect_t = $section{$section};
      my @titles = sort keys %$sect_t;
      my @rated_titles = grep {$sect_t->{$_}->[0] ? $_ : undef} @titles;
      @rated_titles = sort {
        $sect_t->{$b}->[0] <=> $sect_t->{$a}->[0]
      } @rated_titles;
      my @unrated_titles = grep {!$sect_t->{$_}->[0] ? $_ : undef} @titles;
      @unrated_titles = sort {
        $sect_t->{$b}->[3] <=> $sect_t->{$a}->[3]
      } @unrated_titles if $num;
      for (@rated_titles, @unrated_titles)
      {
        my $n=$sect_t->{$_}->[1];
	my $s=$sect_t->{$_}->[2];
        my $r=$sect_t->{$_}->[3];
	$s=0 unless $s;
	my $l=$title{$_}->{line};
	$l=$s>=2.0?"<i>$l</i>":$l;
        $l="<small>$l</small>" if $num and $title{$_}->{num} < 10;
        if ($six and $sect_t->{$_}->[0] < 6) {
          $six=0;
	  $out .= "<tr><td colspan=3>";
	  $out .= "-"x25;
	  $out .= "</td></tr>\n";
	}
        my $ns = $n
          ? sprintf("%0.2f/%d&nbsp;%0.1f", $sect_t->{$_}->[0], $n, $s)
          : $r
            ? 'reviews'
            : '-';
        my $cmt = $title{$_}->{comment} || "";
        my $detail = ($n or $r or $cmt)
          ? "[<a name=\"$i\" href=\"?t=$i#$i\">$ns</a>]"
          : "[$ns]";
        if ($n) {
          if ($cmt =~ /<a href/) {
            my ($s) = $cmt =~ m|<a href=.*?>(.*?)</a>|;
            $out .= sprintf("<tr><td>%2d.</td> <td title=\"%s\">%s</td> <td class=r>%s</td></tr>\n", $j++, $s, $l, $detail);
          } else {
            $out .= sprintf("<tr><td>%2d.</td> <td title=\"%s\">%s</td> <td class=r>%s</td></tr>\n", $j++, $cmt, $l, $detail);
          }
        } elsif ($r) {
          $out .= sprintf("<tr><td> </td> <td title=\"%s\">%s</td> <td class=r>%s</td></tr>\n", $cmt, $l, $detail);
        } elsif ($cmt) {
	  $out .= sprintf("<tr><td> </td>    <td title=\"%s\">%s</td> <td class=r>%s</td></tr>\n", $cmt, $l, $detail);
        } else {
	  $out .= "<tr><td> </td>    <td>$l</td> <td class=r>[-]</td></tr>\n";
        }
        if (_show_detail($i)) {
          $out .= _detail($_,$title{$_},\%critic);
        }
	$i++;
      }
      $out .= "</table>\n\n";
    }
  }
  if (@sections != 1) {
    $out .= "\n<h1><a name=\"all\"></a>All films</h1>\n\nSorted by avg vote, unfiltered:\n<table>\n";
    my $j=1; my $six=1;
    for (sort 
         {
           $a->[1] <=> $b->[1] ? $b->[1] <=> $a->[1]
             : $a->[0] cmp $b->[0]
         } @t)
    {
      my ($l,$a,$n,$t) = @{$_};
      $numratings += $n;
      next unless $t;
      my $s = sprintf("%0.1f",$title{$t}->{stddev}?$title{$t}->{stddev}:0); 
      $l="<i>$l</i>" if $s>=2.0;
      if ($l =~ / \[\Q$comp_section\E\]/) { 
        $l =~ s/ \[\Q$comp_section\E\]//; $l="<b>$l</b>";
      } else { $l =~ s/ \[[\w ]+?\]//;}
      $l="<small>$l</small>" if $title{$t}->{num}<10;
      if ($six and $n and $a<6.0){
        $six=0;
        $out .= "<tr><td colspan=3>"; $out .= "-"x25; $out .= "</td></tr>\n";
      }
      $out .= $n 
        ? sprintf("<tr><td>%2d.</td> <td>$l</td> <td class=r>\[<a name=\"$i\" href=\"?t=$i#$i\">$a/$n&nbsp;$s</a>\]</td></tr>\n",$j++)
        :"<tr><td> </td> <td>$l</td> <td class=r>\[-\]</td></tr>\n";
      if (_show_detail($i)) {
        $out .= _detail($t,$title{$t},\%critic,1);
      }
      $i++;
    }
  }

  my $numc = scalar(keys(%critic));
  if ($numc) {
    $out .= sprintf "</table>\n\n<h1><a name=\"critics\"></a>%d/%d Critics</h1>\n\n",
            $numc - scalar(keys(%badcritic)),$numc;
    $out .= "<i>filter stddev >2.5 from avg</i><br>\n";
    $out .= "<b title=\"stdev over all differences from the film avg to the critics rating.\">stddev</b> name (magazine, cn) numratings <i title=\"avg of the diffs from film avg to rating over all rated films of this critic.
* &gt:1.5 over-rater,
* &lt;-1.5 under-rater,
* -1.5 - 1.5 deviant ratings in boths directions. e.g. ceiling effect\">±diff</i>\n<table>\n";
  
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
      next if /^(IMDB|Letterboxd?|Sundance) _?\d+_Ratings/;
      my $c;
      if ($critic{$_}->{mag}) {
        $c = sprintf("%s (%s, %s)", $_, $critic{$_}->{mag}, $critic{$_}->{cn});
      } else {
        if ($critic{$_}->{cn}) {
          $c = sprintf("%s (%s)", $_, $critic{$_}->{cn});
        } else {
          $c = $_;
          next if $n == 1;
        }
      }
      $c = "<strike>$c</strike>" if $critic{$_}->{stddev} > 2.5;
      $c = "<small>$c</small>" if $n < 10;
      $out .= sprintf "<tr><td>%0.2f</td> <td>%s</td> <td class=r>[<a name=\"$i\" href=\"?t=$i#$i\">%d&nbsp;<i>%+0.1f</i></a>]</td></tr>\n", $critic{$_}->{stddev}, $c, $n, $critic{$_}->{diff}; 
      if (_show_detail($i)) {
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
          which => $BASE,
	  numratings => $numratings, 
	  numreviews => $allreviews, 
	  numc => $numc, 
	  numb => scalar(keys(%badcritic))
  };
}

sub _side_details {
  my %title = %{$_[0]};
  my %critic  = %{$_[1]};
  my @critics_group  = @{$_[2]};
  my $out = '';
  if (Dancer::SharedData->request and params->{t}) {
    my $t = params->{t};
    my (%params_cn, %params_g, %cn, %g_cnt);
    if (params->{cn}) {
      my $params_cn = ref(params->{cn}) eq 'ARRAY' ? params->{cn} : [ params->{cn} ];
      $params_cn{$_}++ for (@$params_cn);
    }
    if (params->{g}) {
      my $params_g = ref(params->{g}) eq 'ARRAY' ? params->{g} : [ params->{g} ];
      $params_g{$_}++ for (@$params_g);
    }
    my $gbox = "<form><input type=hidden name=t value=\"$t\">\n";
    my $cnbox = "";
    for (keys %critic) {
      if (my $cn = $critic{$_}->{cn}) {
	$cn{$cn}++;
	$params_cn{$cn}++ unless params->{cn};
      }
      if (my $g = $critic{$_}->{group}) {
	$g_cnt{$g}++;
	$params_g{$g}++ unless params->{g};
      }
    }
    for (@critics_group) {
      next unless $_;
      my $n = $g_cnt{$_} || 0;
      $gbox .= "<label><input name=\"g\" type=checkbox value=\"$_\"";
      $gbox .= " checked" if $params_g{$_};
      $gbox .= ">$_ ($n)</input></label><br>\n";
    }
    for (sort keys(%cn)) {
      next if $_ eq '?';
      my $n = $cn{$_};
      $cnbox .= "<label><input name=\"cn\" type=checkbox value=\"$_\"";
      $cnbox .= " checked" if $params_cn{$_};
      $cnbox .= ">$_ ($n)</input></label><br>\n";
    }
    $out .= '
          <li>
            <h3>Details</h3>'
	    . ($t ne "*"
	       ? '<p><a href="?t=*"> all details </a></p>'
	       : '<p><a href="?t="> no details </a></p>'
            )
            ;
    $out .= '
            <h4 onclick="flipAll(\'g\')"><b title="Filter ratings (click to flip all)">Poll</b></h4>
	    '
	    . $gbox . 
	    '<input type=submit value="Filter">
	     <span class=hover onclick="selectAll(\'g\')" title="Click here to select all">[all]</span>
	     <span class=hover onclick="flipAll(\'g\')"  title="Click here to invert the selection">[flip]</span><br />' if @critics_group;
    $out .= '
            <h4 onclick="flipAll(\'cn\')"><b title="Filter ratings (click to flip all)">Critics countries</b></h4>
	    '
	    . $cnbox . 
	    '<input type=submit value="Filter">
	     <span class=hover onclick="selectAll(\'cn\')" title="Click here to select all">[all]</span>
	     <span class=hover onclick="flipAll(\'cn\')"  title="Click here to invert the selection">[flip]</span>
	    </form>' .
	    '
          </li>';
  }
  # turn off lb
  else {
    my $s = $critics_group[$#critics_group];
    if (defined $s and $s eq 'Letterboxd') {
      my $gbox = "<form><input type=hidden name=t value=\"\">\n";
      for (@critics_group) {
        next if $_ eq $s;
        $gbox .= "<label><input type=hidden name=g value=\"$_\" checked></input></label>\n";
      }
      $gbox .= "<label><input name=\"g\" type=checkbox value=\"$s\"";
      $gbox .= " checked" if params->{g};
      $gbox .= "> $s </input></label><br>\n";
      if (params->{g}) { # already clicked off
        $gbox .= '<input type=submit value="On">';
      } else {
        $gbox .= '<input type=submit value="Off">';
      }
      $gbox .= "</form>\n";
      $out .= $gbox;
    }
  }
  return $out;
}

sub last_modified {
  my $max = 0;
  for (@_) {
    my $time = (stat($_))[9];
    $max = $time if $time > $max;
  }
  return $max;
}

sub _list {
  my $year = shift;
  my $dir = File::Basename::dirname(__FILE__);
  my $dat = "$dir/../../public/$BASE$year.dat";
  if (Dancer::SharedData->request and request->user_agent =~ m{SemrushBot/}) {
    if (Dancer::SharedData->request and (params->{t} or params->{g})) {
      status 503;
      return 'misbehaving robot';
    }
  }
  my @files = (__FILE__, "$dir/../../views/cannes.tt",
               "$dir/../../views/layouts/main.tt");
  if (-e $dat) {
    my $last_modified = last_modified (@files, $dat);
    header 'Last-Modified' => HTTP::Date::time2str($last_modified);

    do "$dat" or die "invalid ".File::Basename::basename($dat);
  } else {
    eval "require $BASE\::rurban::$year;"
      or die "invalid year $year";
  }

  no strict 'refs';
  my $DATA = ${"$BASE\::rurban::$year\::DATA"};
  #my $PREDICTIONS = ${"$BASE\::rurban::$year\::PREDICTIONS"};
  my $HEADER = ${"$BASE\::rurban::$year\::HEADER"};
  my $FOOTER = ${"$BASE\::rurban::$year\::FOOTER"};
  my @critics = @{"$BASE\::rurban::$year\::critics"};
  my @critics_group = @{"$BASE\::rurban::$year\::critics_group"};
  if ($year eq '2024') {
    @sections = ($comp_section, "Out Of Competition", "Predictions");
  } elsif (@sections == 1) {
    @sections = ($comp_section, "Un Certain Regard", "Out Of Competition", "Quinzaine",
                 "Semaine", "ACID", "Other");
  }
  my $vars = _dump( _read($DATA, \@critics, {}, {}, \@critics_group), $year );
  $vars->{year} = $year;
  #$vars->{REDIRECT_HEAD} = '';
  #$vars->{REDIRECT_BODY} = '';
  #my $redir = 'https://cannes-ratings.org'.request->path;
  #if (request->uri_base =~ /\Qcannes-ratings.herokuapp.com\E/) {
  #    $vars->{REDIRECT} = '<meta http-equiv="refresh" content="5; url='.$redir.'" />
  #<script type="text/javascript">
  #window.location.href = "'.$redir.'"
  #</script>
  #';
  #}
  #if (request->uri_base =~ /\Qcannes-ratings.herokuapp.com\E/ ||
  #    request->uri_base =~ /\Qlocalhost\E/)
  #{
  #    $vars->{REDIRECT_BODY} = '<h3>We moved to <a href="'.$redir.'">cannes-ratings.org</a>, because our free provider Heroku closed all free cloud services. Redhat did that previously. Update your bookmarks please.</h3>';
  #}
  $vars->{HEADER} = $HEADER;
  $vars->{FOOTER} = $FOOTER;
  $vars->{side_details} = _side_details($vars->{title}, $vars->{critic}, \@critics_group);
  if ($DATA) {
    template lc($BASE), $vars;
  } else {
    template 'notyet', $vars;
  }
}

get '/Cannes' => sub {
  _list(2023);
};
get '/Cannes2023' => sub {
  _list(2023);
};
get '/Cannes2022' => sub {
  _list(2022);
};
get '/Cannes2021' => sub {
  _list(2021);
};
get '/Cannes2020' => sub {
  _list(2020);
};
get '/Cannes2019' => sub {
  _list(2019);
};
get '/Cannes2018' => sub {
  _list(2018);
};
get '/Cannes2017' => sub {
  _list(2017);
};
get '/Cannes2016' => sub {
  _list(2016);
};
get '/Cannes2015' => sub {
  _list(2015);
};
get '/Cannes2014' => sub {
  _list(2014);
};
get '/Cannes2013' => sub {
  _list(2013);
};
get '/Cannes2012' => sub {
  _list(2012);
};
get '/Cannes2011' => sub {
  _list(2011);
};
get '/Cannes2010' => sub {
  _list(2010);
};
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
get '/2014' => sub {
  _list(2014);
};
get '/2015' => sub {
  _list(2015);
};
get '/2016' => sub {
  _list(2016);
};
get '/2017' => sub {
  _list(2017);
};
get '/2018' => sub {
  _list(2018);
};
get '/2019' => sub {
  _list(2019);
};
get '/2020' => sub {
  _list(2020);
};
get '/2021' => sub {
  _list(2021);
};
get '/2022' => sub {
  _list(2022);
};
get '/2023' => sub {
  _list(2023);
};
get '/all' => sub {
  my $vars = {}; my (@t, %critic, %title);
  for my $year (@YEARS) {
    no strict 'refs';
    my $dir = File::Basename::dirname(__FILE__);
    my $dat = "$dir/../../public/$BASE$year.dat";
    if (-e $dat) {
      do "$dat" or die "invalid $dat";
    } else {
      eval "require $BASE\::rurban::$year;"
        or die "invalid year $year";
    }
    my $DATA = ${"$BASE\::rurban::$year\::DATA"};
    my $HEADER = ${"$BASE\::rurban::$year\::HEADER"};
    my $FOOTER = ${"$BASE\::rurban::$year\::FOOTER"};
    my @critics = @{"$BASE\::rurban::$year\::critics"};
    my @critics_group = @{"$BASE\::rurban::$year\::critics_group"};
    my @new = _read($DATA, \@critics, \%critic, \%title, \@critics_group);
    %critic = %{$new[0]}; %title = %{$new[1]};
    push @t, @{$new[2]};
    $vars->{year} = $year;
    $vars->{HEADER} = $HEADER;
    $vars->{FOOTER} = $FOOTER;
  }
  my $all = _dump( \%critic, \%title, \@t);
  $all->{year} = "2010-2022";
  {
    no strict 'refs';
    $all->{side_details} = _side_details(\%critic, \%title, 
                             \@{"$BASE\::rurban::2022::critics_group"});
  }
  template lc($BASE), $all;
};

get '/' => sub { redirect '/Berlinale2024'; };

1;
