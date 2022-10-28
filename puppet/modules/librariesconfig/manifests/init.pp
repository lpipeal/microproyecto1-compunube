class librariesconfig {

  exec { 'Instalando express en proyecto':
    command => 'npm install express',
    path => '/usr/bin/',
    cwd => '/home/vagrant/consulService/app',
    require => Package['npm'];
  }

  exec { 'Instalando consul en proyecto':
    command => 'npm install consul',
    path => '/usr/bin/',
    cwd => '/home/vagrant/consulService/app',
    require => Package['npm'];
  }

}
