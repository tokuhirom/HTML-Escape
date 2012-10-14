use strict;
use warnings;
use Module::Build;

use Devel::PPPort;
Devel::PPPort::WriteFile("lib/HTML/ppport.h");

my $build = Module::Build->new(
    license              => 'perl',
    dynamic_config       => 0,

    build_requires       => {
        'Test::More' => '0.98',
        'Test::Requires' => 0,
        'Devel::PPPort'  => '3.20',
    },
    configure_requires   => {
        'Module::Build' => '0.4003',
        'Devel::PPPort'  => '3.20',
    },
    requires             => {
        'Exporter'                      => '0',
        'parent'                        => '0',
        'XSLoader'                      => '0',
        perl => '5.008008',
    },

    no_index    => { 'directory' => [ 'inc' ] },
    name        => 'HTML-Escape',
    module_name => 'HTML::Escape',

    # script_files => [''],

    test_files => (-d '.git' || $ENV{RELEASE_TESTING}) ? 't/ xt/' : 't/',
    recursive_test_files => 1,

    create_readme  => 1,
    create_license => 1,
);
$build->create_build_script();
