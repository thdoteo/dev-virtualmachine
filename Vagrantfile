# -*- mode: ruby -*-
# vi: set ft=ruby :

name = "webDevelopmentVirtualmachine"
ip = "222.222.2.2"
hostname = "dev"
password = "root"
apachefolder = "D:/Workspaces/www"
timezone = "Europe/Paris"

Vagrant.configure(2) do |config|

  config.vm.box = name
  config.vm.box_url = "https://github.com/holms/vagrant-jessie-box/releases/download/Jessie-v0.1/Debian-jessie-amd64-netboot.box"
  config.vm.hostname = hostname
  config.vm.network "private_network", ip: ip

  config.hostmanager.enabled = true
  config.hostmanager.manage_host = true

  config.vm.synced_folder apachefolder, "/var/www", create: true

  config.vm.provider "virtualbox" do |vb|
    vb.gui = false
    vb.name = name
    vb.memory = "512"
  end

  config.vm.provision "shell", path: "config/firststart.sh", args: [password, timezone]
  config.vm.provision "shell", run: "always", path: "config/start.sh", args: [name, ip, hostname, apachefolder]

end