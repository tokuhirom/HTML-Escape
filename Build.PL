use strict;
use warnings;
use Module::Build;


my $class = Module::Build->subclass(
  code => q{
    use Devel::PPPort;

    sub ACTION_build {
        my $self = shift;
        $self->depends_on('ppport_h');
        $self->SUPER::ACTION_build;
    }

    sub ACTION_ppport_h {
        my $self = shift;
        my $filepath = 'lib/HTML/ppport.h';
        unless (-e $filepath) {
            print "Writing $filepath\n";
            Devel::PPPort::WriteFile($filepath);
        }
        $self->add_to_cleanup($filepath);
    }
  },
);

my $build = $class->new(
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
