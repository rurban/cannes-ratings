#!/bin/sh
perl -MFile::Basename=basename -lne'if (/(\d+) titles for (.+)/){ for $d (<"public/$2/*.html">){ unlink($d) if basename($d,".html") > $1}}' titles.log

