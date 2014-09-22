# == Class: notifyme
#
# Full description of class notifyme here.
#
# === Parameters
#
# [*sample_parameter*]
#   Explanation of what this parameter affects and what it defaults to.
#
class notifyme (
  $package_name = $notifyme::params::package_name,
  $service_name = $notifyme::params::service_name,
) inherits notifyme::params {

  # validate parameters here

  class { 'notifyme::install': } ->
  class { 'notifyme::config': } ~>
  class { 'notifyme::service': } ->
  Class['notifyme']
}
