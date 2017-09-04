# -*- mode: ruby -*-
# vi: set ft=ruby :

Vagrant.configure("2") do |config|
  config.vm.define "puppet" do |server|
    server.vm.hostname = "puppet"
    server.vm.box = "sbeliakou/centos-7.3-x86_64-minimal"
    server.vm.network "private_network", ip: "192.168.50.10"
    server.vm.provider "virtualbox" do |vb|
      vb.name = "puppet"
      vb.memory = "4096"
    end

#    server.vm.provision "shell", path: "scripts/chef.sh"
  end

  config.vm.define "host1" do |host1|
    host1.vm.hostname = "host-agent1"
    host1.vm.box = "sbeliakou/centos-7.3-x86_64-minimal.box"
    host1.vm.network "private_network", ip: "192.168.50.11"
    host1.vm.provider "virtualbox" do |vb|
      vb.name = "Host1"
      vb.memory = "512"
    end
  end

  config.vm.define "host2" do |host2|
    host2.vm.hostname = "host-agent2"
    host2.vm.box = "ubuntu/trusty64"
    host2.vm.network "private_network", ip: "192.168.50.12"
    host2.vm.provider "virtualbox" do |vb|
      vb.name = "Host2"
      vb.memory = "512"
    end
  end 

  config.vm.define "zabbix" do |zabbix|
    zabbix.vm.hostname = "zabbix"
    zabbix.vm.box = "sbeliakou/centos-7.3-x86_64-minimal.box"
    zabbix.vm.network "private_network", ip: "192.168.50.13"
    zabbix.vm.provider "virtualbox" do |vb|
      vb.name = "zabbix"
      vb.memory = "1024"
    end
  end 
end
