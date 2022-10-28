class artilleryconfig {

  exec { 'descargar_node':
    command => 'curl -sL https://deb.nodesource.com/setup_14.x | sudo -E bash -',
    path => '/usr/bin/';
  }

  exec { 'instalar_node':
    command => 'sudo apt-get install -y nodejs',
    path => '/usr/bin/',
    require => Exec['descargar_node'];
  }

  exec { 'Instalar artillery':
    command => 'npm install -g artillery@latest',
    path => '/usr/bin/',
    require => Exec['instalar_node'];
  }

}
