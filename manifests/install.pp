# == Class redistest::install
#
# This class is called from redistest for install.
#
class redistest::install {

  package { $::redistest::package_name:
    ensure => present,
  }
}
