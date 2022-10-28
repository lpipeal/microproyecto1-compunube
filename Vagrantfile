# -*- mode: ruby -*-
# vi: set ft=ruby :

Vagrant.configure("2") do |config|

  if Vagrant.has_plugin? "vagrant-vbguest"
    config.vbguest.no_install  = true
    config.vbguest.auto_update = false
    config.vbguest.no_remote   = true
  end

  config.vm.define :servidorUbuntu do |servidorUbuntu|
    servidorUbuntu.vm.box = "bento/ubuntu-20.04"
    servidorUbuntu.vm.hostname = "servidor"
    servidorUbuntu.vm.network :private_network, ip: "192.168.100.3"
    servidorUbuntu.vm.provision "shell", path: "script_puppet.sh"
    # servidorUbuntu.vm.synced_folder './', '/home/vagrant', type: "virtualbox"
    servidorUbuntu.vm.provision :puppet do |puppet|
      puppet.manifests_path = "puppet/manifests"
      puppet.manifest_file = "config_server.pp"
      puppet.module_path = "puppet/modules"
    end
  end

  config.vm.define :clienteUbuntu do |clienteUbuntu|
    clienteUbuntu.vm.box = "bento/ubuntu-20.04"
    clienteUbuntu.vm.hostname = "cliente"
    clienteUbuntu.vm.network :private_network, ip: "192.168.100.4"
    clienteUbuntu.vm.provision "shell", path: "script_puppet.sh"
    #clienteUbuntu.vm.synced_folder './', '/home/vagrant', type: "virtualbox"
    clienteUbuntu.vm.provision :puppet do |puppet|
      puppet.manifests_path = "puppet/manifests"
      puppet.manifest_file = "config_client.pp"
      puppet.module_path = "puppet/modules"
    end
  end

  config.vm.define :clienteUbuntuArtillery do |clienteUbuntuArtillery|
    clienteUbuntuArtillery.vm.box = "bento/ubuntu-20.04"
    clienteUbuntuArtillery.vm.hostname = "artillery"
    clienteUbuntuArtillery.vm.network :private_network, ip: "192.168.100.5"
    clienteUbuntuArtillery.vm.provision "shell", path: "script_puppet.sh"
    clienteUbuntuArtillery.vm.synced_folder './', '/home/vagrant', type: "virtualbox"
    clienteUbuntuArtillery.vm.provision :puppet do |puppet|
      puppet.manifests_path = "puppet/manifests"
      puppet.manifest_file = "config_artillery.pp"
      puppet.module_path = "puppet/modules"
    end
  end
end
