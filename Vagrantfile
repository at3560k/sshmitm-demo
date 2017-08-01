# -*- mode: ruby -*-
# vi: set ft=ruby :

Vagrant.configure(2) do |config|

  config.vm.box = "ubuntu/xenial64"

  # cachier -- apt faster
  config.cache.auto_detect = true 

  # hostmanager doesn't work right in this box -- freezes
  config.hostmanager.enabled = false

  config.vm.provider "virtualbox" do |vb|
    vb.memory = "1024"
  end

  config.vm.define "mallory" do |m1|
    m1.vm.hostname = 'mallory.test'
    m1.vm.network :private_network, ip: "172.28.128.10"
    m1.vm.provision :shell, :path => "shell/mallory.sh"
  end

  config.vm.define "alice" do |m2|
    m2.vm.hostname = 'alice.test'
    m2.vm.network :private_network, ip: "172.28.128.20"
    m2.vm.provision :shell, :path => "shell/alice.sh"
  end

  config.vm.define "bob" do |m3|
    m3.vm.hostname = 'bob.test'
    m3.vm.network :private_network, ip: "172.28.128.30"
    m3.vm.provision :shell, :path => "shell/bob.sh"
  end

end
