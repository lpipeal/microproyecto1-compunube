class gitconfig {

  package { ['git']:
    ensure => present;
  }

  file { 'verificar proyecto':
    ensure  => directory,
    path    => '/home/vagrant/';
  }

  exec { 'clonar proyecto':
    command => 'git clone https://github.com/omondragon/consulService',
    cwd => '/home/vagrant/',
    path => '/usr/bin/',
    require => Package['git'];
  }

}
