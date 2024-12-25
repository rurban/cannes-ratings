#!/usr/bin/perl -pi

s{href="\?t=(\d+)#\d+"}{onclick="l($1)"}g;
s{href="/((?:Cannes|Sundance|Berlinale)\d*)"}{href="../$1/index.html"};
s{href="/css/style.css"}{href="../css/style.css"};
s{^<script src="/js/}{<script src="../js/};

#wrong internal links:
s{href="/(\d+).html"}{href="$1.html"}g;
s{Powered by <a href="http://perldancer.org/">Dancer</a> 1.3521, fly.io free <a href="http://fly.io/">cloud services</a>}
 {Powered by static <a href="https://pages.github.com/">GitHub Pages</a>};
