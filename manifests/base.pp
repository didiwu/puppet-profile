class profile::base( 
  $ntp_servers = [
    '0.ubuntu.pool.ntp.org',
    '1.ubuntu.pool.ntp.org',
  ],
) { 
  include ::ssh
  include ::basepkg
  class { '::ntp': 
    servers => $ntp_servers,
  }

  if $facts['os']['family'] == 'RedHat' {
    include ::profile::selinux
  }
}
