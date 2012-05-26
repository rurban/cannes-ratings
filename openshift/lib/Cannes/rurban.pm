package openshift;
use Dancer ':syntax';

our $VERSION = '0.1';

get '/' => sub {
    template 'index';
};

get '/subfolder' => sub {
    "Hello, World!";
};

true;
