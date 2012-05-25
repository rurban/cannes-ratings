#!/usr/bin/env perl
use Dancer ':syntax';
use Plack::Runner;

# For some reason Apache SetEnv directives dont propagate
# correctly to the dispatchers, so forcing PSGI and env here 
# is safer.
set apphandler => 'PSGI';
set environment => 'production';

my $root = $ENV{'DOCUMENT_ROOT'} || '';
my @path = ('..', 'openshift', 'bin', 'app.pl');
my $psgi = path($root ? ($root, @path) : @path);
die "Unable to read startup script: $psgi" unless -r $psgi;

Plack::Runner->run($psgi);
