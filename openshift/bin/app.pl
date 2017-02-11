#!/usr/bin/env perl
use Dancer ':syntax';

use lib "lib";
use Cannes;
use Sundance;
use Berlinale;

for my $base (qw(Cannes Sundance Berlinale)) {
  no strict 'refs';
  for (@{"$base\::YEARS"}) {
    get "/".$base."$_" => sub {
      Festivals::_list($base, $_);
    };
  }
}

# the current default
get '/' => sub {
  redirect '/Berlinale2017';
};

dance;
