#!/usr/bin/env perl
use Dancer ':syntax';
use Plack::Runner;

# For some reason Apache SetEnv directives dont propagate
# correctly to the dispatchers, so forcing PSGI and env here 
# is safer.
set apphandler => 'PSGI';
set environment => 'production';

my $psgi = path($ENV{'DOCUMENT_ROOT'}, '..', 'openshift', 'bin', 'app.pl');
die "Unable to read startup script: $psgi" unless -r $psgi;

Plack::Runner->run($psgi);
