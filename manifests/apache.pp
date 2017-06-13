class profile::apache( 
  Hash $apache_vhost_servers,
  Boolean $default_vhost = false,
  #Integer $port          = 80,
  #String $docroot        = '/var/www/node2',
) { 
  class { '::apache': 
    default_vhost => $default_vhost,
  }
 
  create_resources(::apache::vhost, $apache_vhost_servers)
  #::apache::vhost { 'node2':
  #  port => $port,
  #  docroot => $docroot
  #}
}
