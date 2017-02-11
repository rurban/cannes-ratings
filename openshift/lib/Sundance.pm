package Sundance;
our @ISA = ('Festivals');
#use Dancer ':syntax';
#use File::Basename 'dirname';
#use utf8;

our $VERSION = '0.3';
our $BASE = 'Sundance';
our @YEARS = qw(2015 2016 2017);
our $comp_section = 'U.S. Dramatic';
our @sections =
  ($comp_section, "World Dramatic", "U.S. Documentaries", "World Documentaries",
   "NEXT", "New Frontier", "Midnight", "Spotlight", "Kids", "Premieres",
   "Documentary Premieres", "Special Events", 
   "Slamdance");

use lib '.';
require Festivals;
Festivals::init_routes($BASE);

1;
