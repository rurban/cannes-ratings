use strict;
use warnings;
use ExtUtils::MakeMaker;

WriteMakefile(
    NAME                => 'Cannes::rurban',
    AUTHOR              => q{Reini Urban <rurban@cpanel.net>},
    VERSION_FROM        => 'lib/Cannes/rurban.pm',
    ABSTRACT            => 'Cannes Critics Ratings Dancer UI',
    ($ExtUtils::MakeMaker::VERSION >= 6.3002
      ? ('LICENSE'=> 'perl')
      : ()),
    PL_FILES            => {},
    PREREQ_PM => {
        'Test::More' => 0,
        'YAML'       => 0,
        'Dancer'     => 1.3072,
    },
    dist                => { COMPRESS => 'gzip -9f', SUFFIX => 'gz', },
    clean               => { FILES => 'openshift-*' },
);
