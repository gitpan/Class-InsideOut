
use strict;
use warnings;

use 5.008;

use ExtUtils::MakeMaker 6.30;



my %WriteMakefileArgs = (
  "ABSTRACT" => "a safe, simple inside-out object construction kit",
  "AUTHOR" => "David A. Golden <dagolden\@cpan.org>",
  "BUILD_REQUIRES" => {},
  "CONFIGURE_REQUIRES" => {
    "ExtUtils::MakeMaker" => "6.30"
  },
  "DISTNAME" => "Class-InsideOut",
  "EXE_FILES" => [],
  "LICENSE" => "apache",
  "NAME" => "Class::InsideOut",
  "PREREQ_PM" => {
    "Carp" => 0,
    "Class::ISA" => 0,
    "Exporter" => 0,
    "Scalar::Util" => "1.09",
    "Storable" => 0,
    "strict" => 0,
    "vars" => 0
  },
  "TEST_REQUIRES" => {
    "Config" => 0,
    "DynaLoader" => 0,
    "ExtUtils::MakeMaker" => 0,
    "File::Find" => 0,
    "File::Spec" => 0,
    "File::Spec::Functions" => 0,
    "File::Temp" => 0,
    "IO::File" => 0,
    "List::Util" => 0,
    "Test::More" => "0.45",
    "XSLoader" => 0,
    "threads" => 0,
    "warnings" => 0
  },
  "VERSION" => "1.12",
  "test" => {
    "TESTS" => "t/*.t"
  }
);


unless ( eval { ExtUtils::MakeMaker->VERSION(6.63_03) } ) {
  my $tr = delete $WriteMakefileArgs{TEST_REQUIRES};
  my $br = $WriteMakefileArgs{BUILD_REQUIRES};
  for my $mod ( keys %$tr ) {
    if ( exists $br->{$mod} ) {
      $br->{$mod} = $tr->{$mod} if $tr->{$mod} > $br->{$mod};
    }
    else {
      $br->{$mod} = $tr->{$mod};
    }
  }
}

unless ( eval { ExtUtils::MakeMaker->VERSION(6.56) } ) {
  my $br = delete $WriteMakefileArgs{BUILD_REQUIRES};
  my $pp = $WriteMakefileArgs{PREREQ_PM};
  for my $mod ( keys %$br ) {
    if ( exists $pp->{$mod} ) {
      $pp->{$mod} = $br->{$mod} if $br->{$mod} > $pp->{$mod};
    }
    else {
      $pp->{$mod} = $br->{$mod};
    }
  }
}

delete $WriteMakefileArgs{CONFIGURE_REQUIRES}
  unless eval { ExtUtils::MakeMaker->VERSION(6.52) };

WriteMakefile(%WriteMakefileArgs);



