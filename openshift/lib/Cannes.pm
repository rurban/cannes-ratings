package Cannes;
use Dancer ':syntax';
use File::Basename qw(dirname basename);
use utf8;

our $VERSION = '0.2';
our $BASE  = 'Cannes';
our @YEARS = (2010..2016);
our $comp_section = 'Competition';
our @sections = 
  ($comp_section, "Un Certain Regard", "Out Of Competition", "Quinzaine", 
   "Semaine", "ACID", "Other");

use lib '.';
require Festivals;
Festivals::init_routes($BASE);

for (@YEARS) {
  get "/".$_ => sub {
    Festivals::_list($BASE, $_);
  };
}

1;
