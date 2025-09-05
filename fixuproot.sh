#!/bin/bash
# for public/index.html only
# what dir is it? e.g d=Cannes2024 => <base href=$d/ />
# to be run after the Cannes2024/index.html fixups

cd `dirname $0`/public
d="$(perl -lne'm{blob/master/public/(.+?)\.dat"} && print $1' index.html)"
case $d in
    Cannes20[0-9][0-9]) ;;
    Berlinale20[0-9][0-9]) ;;
    Sundance20[0-9][0-9]) ;;
    Venice20[0-9][0-9]) ;;
    *) exit 1 ;;
esac
echo $d

perl -pi -e'BEGIN{$d=shift}
if ($_ eq qq(<meta http-equiv="Content-type" content="text/html; charset=utf-8" />\n)) {
  print "<base href=\"$d/\" />\n";
}' $d index.html

#dquoted to insert $d
#perl -pi -e's{href="/?(\d+).html"}{href="$1.html"};' index.html
#unquoted
#perl -pi -e's{href="../((:?Cannes|Sundance|Berlinale)\d*/index\.html)"}{href="$1/index.html"}g;' index.html
#perl -pi -e's{href="../((:?Cannes|Sundance|Berlinale)\d*)"}{href="$1/index.html"}g;' index.html

#wrong internal links:
#s/href="/(\d+).html"/href="$1.html"/g;
