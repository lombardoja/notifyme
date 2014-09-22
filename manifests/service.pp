# == Class notifyme::service
#
# This class is meant to be called from notifyme
# It ensure the service is running
#
class notifyme::service {

  service { $notifyme::service_name:
    ensure     => running,
    enable     => true,
    hasstatus  => true,
    hasrestart => true,
  }
}
