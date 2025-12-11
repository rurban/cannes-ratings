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
         Cannes201{0,1,2,3,4,5,6,7,8,9} Cannes202{0,1,2,3,4,5} \
         Venice2025 \
         Sundance201{5,6,7,8,9} Sundance202{0,1,2,3,4,5,6} >dirs.txt
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
    Venice20[0-9][0-9])    fest=Venice  ;;
    *) exit 1 ;;
esac
year="$(perl -le'shift =~ /(20\d\d)/ && print $1' "$d")"
test -d "public/$d" || mkdir -p "public/$d"
#for x in Cannes Sundance Berlinale; do
#    if [ ! -e public/$x ]; then
#        cd public && ln -s $x$thisyear $x && cd -
#    fi
#done
l=public/$d/no-lb.html
echo "$l"
echo env g=Letterboxd perl -Ilib -M$fest::rurban -e"\"$fest::rurban::_dump_all($year)\""
env g=Letterboxd perl -Ilib -M$fest::rurban -e"$fest::rurban::_dump_all($year)"
ls public/$d/*no-lb.html 2>/dev/null && perl -pi fixuplinks.pl public/$d/*no-lb.html

echo perl -Ilib -M$fest::rurban -e"\"$fest::rurban::_dump_all($year)\""
perl -Ilib -M$fest::rurban -e"$fest::rurban::_dump_all($year)"
perl -pi fixuplinks.pl public/$d/*.html
