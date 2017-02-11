package Berlinale;
our @ISA = ('Festivals');

our $VERSION = '0.3';
our $BASE    = 'Berlinale';
our @YEARS   = qw(2016 2017);
our $comp_section = 'Wettbewerb';
our @sections =
  ($comp_section, "Forum", "Panorama", "Generation", 
   "Perspektive Deutsches Kino", "Forum Expanded", "Special",
   "Native", "Retrospektive", "Woche der Kritik" );

use lib '.';
require Festivals;
Festivals::init_routes($BASE);

1;
