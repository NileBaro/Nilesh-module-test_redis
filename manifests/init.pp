# == Class: redistest
#
# Full description of class redistest here.
#
# === Parameters
#
# [*sample_parameter*]
#   Explanation of what this parameter affects and what it defaults to.

class redistest (

  $package_name = $::redistest::params::package_name,
  $service_name = $::redistest::params::service_name,

) inherits ::redistest::params {


  # Add hiera() lookups here, with validation


}
