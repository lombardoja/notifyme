# == Class notifyme::params
#
# This class is meant to be called from notifyme
# It sets variables according to platform
#
class notifyme::params {
  case $::osfamily {
    'Debian': {
      $package_name = 'notifyme'
      $service_name = 'notifyme'
    }
    'RedHat', 'Amazon': {
      $package_name = 'notifyme'
      $service_name = 'notifyme'
    }
    default: {
      fail("${::operatingsystem} not supported")
    }
  }
}
