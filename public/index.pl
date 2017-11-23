#!/usr/bin/env perl
use Dancer ':syntax';
use Plack::Runner;

# For some reason Apache SetEnv directives dont propagate
# correctly to the dispatchers, so forcing PSGI and env here 
# is safer.
set apphandler => 'PSGI';
my $root = $ENV{'DOCUMENT_ROOT'} || '';
if ($ENV{'REMOTE_ADDR'} eq '127.0.0.1') {
  set environment => 'development';
  #set environment => 'production';
  #set auto_reload => 1;
} elsif ($ENV{'REMOTE_ADDR'} eq '188.108.36.74') {
  set environment => 'development';
} else {
  set environment => 'production';
}

my @path = ('..', 'bin', 'app.pl');
my $psgi = path($root ? ($root, @path) : @path);
die "Unable to read startup script: $psgi" unless -r $psgi;

Plack::Runner->run($psgi);
