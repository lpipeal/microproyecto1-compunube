class runconsul{

  exec { 'run consul':
    command => 'consul agent -ui -client=0.0.0.0 -server -bootstrap-expect=1 -data-dir=/tmp/consul -node=agent-one -bind=192.168.100.3 -enable-script-checks=true -config-dir=/etc/consul.d',
    #require => package['consul'],
    logout => 'true',
    path => '/usr/bin/';
  }
}