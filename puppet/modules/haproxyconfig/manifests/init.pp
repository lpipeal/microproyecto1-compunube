class haproxyconfig {
  package { ['haproxy']:
    ensure => present;
  }

  # Pull down the main aliases file
  file { '/etc/haproxy':
    source => 'puppet:///modules/haproxyconfig/files/haproxy.cfg',
  }

  # Rebuild the database, but only when the file changes
  exec { newaliases:
    path        => ['/etc/haproxy/haproxy.cfg'],
    subscribe   => File['/etc/haproxy'],
    refreshonly => true,
  }

  service { "haproxy":
    ensure => running,
    enable => true,
    require => Package['haproxy'];
  }

}