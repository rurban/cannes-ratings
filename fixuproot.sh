#!/bin/bash
# for public/index.html only
# what dir is it? e.g d=Cannes2024
# to be run after the Cannes2024/index.html fixups

cd `dirname $0`/public
d="$(perl -lne'm{blob/master/public/(.+?)\.dat"} && print $1' index.html)"
case $d in
    Cannes20[0-9][0-9]) ;;
    Berlinale20[0-9][0-9]) ;;
    Sundance20[0-9][0-9]) ;;
    *) exit 1 ;;
esac
echo $d 

#dquoted to insert $d
perl -pi -e"s{href=\"/?(\d+).html\"}{href=\"$d/\$1.html\"};" index.html
#unquoted
perl -pi -e's{href="../((:?Cannes|Sundance|Berlinale)\d*/index\.html)"}{href="$1/index.html"}g;' index.html
perl -pi -e's{href="../((:?Cannes|Sundance|Berlinale)\d*)"}{href="$1/index.html"}g;' index.html
perl -pi -e's{href="../css/style.css"}{href="css/style.css"};' index.html

#wrong internal links:
#s/href="/(\d+).html"/href="$1.html"/g;
