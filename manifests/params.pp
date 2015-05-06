# == Class redistest::params
#
# This class is meant to be called from redistest.
# It sets variables according to platform.
#
class redistest::params {
  case $::osfamily {
    'Debian': {
      $package_name = 'redistest'
      $service_name = 'redistest'
    }
    'RedHat', 'Amazon': {
      $package_name = 'redistest'
      $service_name = 'redistest'
    }
    default: {
      fail("${::operatingsystem} not supported")
    }
  }
}
