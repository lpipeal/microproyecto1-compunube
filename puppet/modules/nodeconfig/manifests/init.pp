class nodeconfig {

  package { ['nodejs']:
    ensure => present;
  }

  package { ['npm']:
    ensure => present;
  }

}
