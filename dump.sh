#!/bin/bash
thisyear=2025
cd $(dirname "$0")
if [ -z "$1" ]; then
    echo Berlinale201{6,7,8,9} Berlinale202{0,1,2,3,4,5} \
         Cannes201{0,1,2,3,4,5,6,7,8,9} Cannes202{0,1,2,3,4,5} \
         Sundance201{6,7,8,9} Sundance202{0,1,2,3,4,5} > dirs.txt
    for d in `cat dirs.txt`; do
        ./dump.sh $d
    done
    exit 0
fi
d="$1"
case $d in
    Cannes20[0-9][0-9]) ;;
    Berlinale20[0-9][0-9]) ;;
    Sundance20[0-9][0-9]) ;;
    *) exit 1 ;;
esac
test -d public/$d || mkdir -p public/$d
for x in Cannes Sundance Berlinale; do
    if [ ! -e public/$x ]; then
        cd public && ln -s $x$thisyear $x && cd -
    fi
done
# check age
f=public/$d/index.html
if [ ! -f "$f" ] || [ public/$d.dat -nt "$f" ] || [ lib/$d/rurban.pm -nt "$f" ]; then
    echo $d
    curl -s -o $f http://127.0.0.1:5000/$d
    perl -pi fixuplinks.pl $f
fi
t=$(perl -ne'if (/href="\/?(\d+).html"/){$t=$1}; END{print $t}' $f)
if [ -z "$t" ]; then
    t=$(perl -ne'if (/href="\?t=(\d+)#\d+"/){$t=$1}; END{print $t}' $f)
fi
if [ -n "$t" ]; then
    echo $t titles for $d
    for i in $(seq $t); do
        f="public/$d/$i.html"
        if [ ! -f "$f" ] || [ public/$d.dat -nt "$f" ] || [ "$(stat --format=%s "$f")" -lt 1000 ]; then
            echo $f
            curl -s -o $f "http://127.0.0.1:5000/$d?t=$i"
            perl -pi fixuplinks.pl $f
        fi
    done
fi
