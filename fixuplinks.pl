#!/usr/bin/perl -pi

s{href="\?t=(\d+)#\d+"}{href="$1.html"}g;
s{href="/((?:Cannes|Sundance|Berlinale)\d*)"}{href="../$1/index.html"};
s{href="/css/style.css"}{href="../css/style.css"};

#wrong internal links:
s{href="/(\d+).html"}{href="$1.html"}g;
