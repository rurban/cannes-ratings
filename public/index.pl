#!/usr/bin/env perl
use Dancer ':syntax';
use Plack::Runner;

# For some reason Apache SetEnv directives dont propagate
# correctly to the dispatchers, so forcing PSGI and env here 
# is safer.
set apphandler => 'PSGI';
my $root = $ENV{'DOCUMENT_ROOT'} || '';
if (-d '/app') {
  set environment => 'production';
  #set auto_reload => 1;
} elsif (exists $ENV{'REMOTE_ADDR'} and $ENV{'REMOTE_ADDR'} eq '188.108.36.74') {
  set environment => 'production';
} else {
  set environment => 'development';
}

my @path = ('..', 'bin', 'app.pl');
my $psgi = path($root ? ($root, @path) : @path);
die "Unable to read startup script: $psgi" unless -r $psgi;

my $runner = Plack::Runner->new;
$runner->parse_options(@ARGV);
$runner->run($psgi);
