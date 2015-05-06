# == Class redistest::service
#
# This class is meant to be called from redistest.
# It ensure the service is running.
#
class redistest::service {

  service { $::redistest::service_name:
    ensure     => running,
    enable     => true,
    hasstatus  => true,
    hasrestart => true,
  }
}
