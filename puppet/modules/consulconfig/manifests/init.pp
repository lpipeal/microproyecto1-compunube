class consulconfig {
  exec { 'get consul':
    command => 'wget -O- https://apt.releases.hashicorp.com/gpg | gpg --dearmor | sudo tee /usr/share/keyrings/hashicorp-archive-keyring.gpg',
    path => '/usr/bin/';
  }

  exec { 'sign':
    command => 'echo "deb [signed-by=/usr/share/keyrings/hashicorp-archive-keyring.gpg] https://apt.releases.hashicorp.com $(lsb_release -cs) main" | sudo tee /etc/apt/sources.list.d/hashicorp.list',
    path => '/usr/bin/';
  }

  package { ['consul']:
    ensure => present;
  }

}
