#!/bin/bash
#thisyear=2025
cd "$(dirname "$0")" || exit
if [ "$1" = "-f" ]; then
    force=1
    args="-f"
    shift
fi
if [ "$1" = "-n" ]; then
    nolinks=1
    args="$args -n"
    shift
fi
if [ -z "$1" ]; then
    echo Berlinale201{6,7,8,9} Berlinale202{0,1,2,3,4,5} \
         Cannes201{0,1,2,3,4,5,6,7,8,9} Cannes202{0,1,2,3,4} \
         Sundance201{5,6,7,8,9} Sundance202{0,1,2,3,4,5} >dirs.txt
    for d in $(cat dirs.txt); do
        ./dump.sh $args "$d"
    done
    #rm dirs.txt
    exit 0
fi
d="$1"
fest=
case $d in
    Cannes20[0-9][0-9])    fest=Cannes    ;;
    Berlinale20[0-9][0-9]) fest=Berlinale ;;
    Sundance20[0-9][0-9])  fest=Sundance  ;;
    *) exit 1 ;;
esac
year="$(perl -le'shift =~ /(20\d\d)/ && print $1' "$d")"
test -d "public/$d" || mkdir -p "public/$d"
#for x in Cannes Sundance Berlinale; do
#    if [ ! -e public/$x ]; then
#        cd public && ln -s $x$thisyear $x && cd -
#    fi
#done
# check age
f=public/$d/index.html
if [ -n "$force" ] || [ ! -f "$f" ] || [ "public/$d.dat" -nt "$f" ] || [ "lib/$d/rurban.pm" -nt "$f" ]; then
    echo "$f"
    perl -Ilib -M$fest::rurban -e"$fest::rurban::_list($year)" >"$f"
    perl -pi fixuplinks.pl "$f"
fi
l=public/$d/no-lb.html
if [ -n "$force" ] || [ ! -f "$l" ] || [ "public/$d.dat" -nt "$l" ] || [ "lib/$d/rurban.pm" -nt "$l" ]; then
    echo "$l"
    perl -Ilib -M$fest::rurban -e"$fest::rurban::_list($year,'no-lb')" >"$l"
    perl -pi fixuplinks.pl "$l"
fi
t=$(perl -ne'if (/onclick="l\((\d+)\)"/){$t=$1}; END{print $t}' "$f")
if [ -z "$t" ]; then
    t=$(perl -ne'if (/href="\?t=(\d+)#\d+"/){$t=$1}; END{print $t}' "$f")
fi
# echo "$t titles for $d" >>titles.log
if [ -n "$t" ] && [ -z "$nolinks" ]; then
    echo "$t titles for $d"
    for i in $(seq $t); do
        f="public/$d/$i.html"
        if [ ! -f "$f" ] || [ public/$d.dat -nt "$f" ] || [ "$(stat --format=%s "$f")" -lt 20 ]; then
            echo "$f"
            perl -Ilib -M$fest::rurban -e"$fest::rurban::_list($year,$i)" >"$f"
            perl -pi fixuplinks.pl "$f"
        fi
    done
fi
