# -*- mode: ruby -*-
# vi: set ft=ruby :

name = "dev"
ip = "222.222.2.2"
hostname = "dev"
password = "root"
apachesyncfolder = "D:/dev"
timezone = "Europe/Paris"

Vagrant.configure(2) do |config|

  config.vm.box = name
  config.vm.box_url = "https://dl.dropboxusercontent.com/u/197673519/debian-7.2.0.box"
  config.vm.hostname = hostname
  config.vm.network "private_network", ip: ip

  config.hostmanager.enabled = true
  config.hostmanager.manage_host = true

  config.vm.synced_folder apachesyncfolder, "/var/www", create: true

  config.vm.provider "virtualbox" do |vb|
    vb.gui = false
    vb.name = name
    vb.memory = "1024"
  end

  config.vm.provision "shell", path: "config/firststart.sh", args: [password, timezone]
  config.vm.provision "shell", run: "always", path: "config/start.sh", args: [name, ip, hostname, apachesyncfolder]

end