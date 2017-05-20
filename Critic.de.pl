#!/usr/local/bin/perl5.24 -s
# usage: ./Critic.de.pl
# no timestamp by server
use File::Copy;
use utf8;
use v5.20;
my $url = "http://jury.critic.de/cannes/";
my $c = "Critic.de.html";
my $bak = "$c.old";
no strict;
$max = 4;

unless ($u) {
  move $c, $bak;
  print `wget -U "Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/28.0.1500.52 Safari/537.36" -O $c $url`;
}
END {
  move($bak, $c) if -s $bak and !-s $c;
}

if (-s $c) {
  my $diff = -f $bak ? `diff -bu $c $bak` : "";
  if ($u or $diff) {
    #warn "process updates";
    if (1 or -f $bak) {
      open $cf, ">", "$c.text";
      select $cf;
    }
    $ch = readhtml($c);
    close $cf;
    if (-f $bak) {
      open $bf, ">", "$bak.text";
      select $bf;
      $bh = readhtml($bak);
      close $bf;
      select *STDOUT;
      my $cmd = "diff -bu $bak.text $c.text";
      print "$cmd\n";
      print `$cmd`;
    }
  } else {
    warn "no updates";
    unlink $bak;
  }
} else {
  warn "empty response";
  move $bak, $c;
}

sub readhtml {
  my $c = shift;
  open $fh, $c or die;
  my (@c, @r, %t, @t, $t);
  while ($_ = <$fh>) {
    s/\r\n$//;
    # critics
    if (m{<th class='colkritiker'>}) {
      s{.*?<thead>.*?Sektion</a></th>}{};
      s{<tfoot>.*}{};
      $all = $_;
      @c = grep { 
	if (m{ class='kritiker sort'>(.+?)</a>}) {
          $_ = $1;
          s/<br>/ /g;
          s/G.Marchini Camia/#Giovanni Marchini Camina /;
          s/Pamela Biénzobas/#Pamela Bienzobas/;
          s/Boris Nelepo/#Boris Nelepo/;
          s/Daniel Kasman/#Daniel Kasman/;
          s/Rüdiger Suchsland/#Rüdiger Suchsland/;
          $_
        } else {
          "";
        }
      } split("</th><th", $_);
      warn scalar @c." critics\n";

      # @t
      s{^.*<tbody>}{};
      s{</tbody>.*$}{};
      my %r = (
        '+++' => 9,
        '++'  => "7.5",
        '+'   => 6,
        '+-'  => 5,
        '-'   => 4,
        '--'  => "2.5",
        '---' => 1,
      );

      for my $tr (split("</tr><tr>", $_)) {
	if ($tr =~ m{ target='_blank'>(.+?)</a>}) {
          my $t = $1;
          $t =~ s/<br>/ /g;
          $ti++;
          if ($tr =~ m{<span class='movie_title_ov'>(.+?)</span>}) {
            printf("\n\"%s %s\"\n\n", uc($t), $1);
          } else {
            printf("\n\"%s\"\n\n", uc($t));
          }
        }
        printf("# critic.de\n");

        $tr =~ s{^.*?(</td><td class='wertung')}{$1};
        $i = 0;
        for (split("/td><td ", $tr)) {
          my ($r, $link);
          if (m{class='wertung' title='.+?'><a href='(.+?)' target='_blank'>(.*?)</a><}) {
            $link = $1; $r = $2;
          }
          elsif (m{class='wertung' title='.+?'>(.*?)<}) {
            $r = $1;
          } else {
            next;
          }
          $r =~ s/\s//g;
          if ($r) {
            $r = $r{$r} if $r{$r};
            if ($link) {
              printf("%-22s%-8s%s\n", $c[$i], $r, $link);
            } else {
              printf("%-22s%s\n", $c[$i], $r);
            }
          } elsif ($link) {
            printf("%-22s%-8s%s\n", $c[$i], "", $link);
          }
          $i++;
        }
      }
      warn "$ti titles\n";
    }
  }
  print "\n";
}

sub update {
  my $diff = shift;
}
