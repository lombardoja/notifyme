# == Class notifyme::install
#
class notifyme::install {

  package { $notifyme::package_name:
    ensure => present,
  }
}
