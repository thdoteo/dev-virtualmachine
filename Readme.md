##Webdev-VirtualMachine

A vagrant virtual machine to start developing faster !  
You can see also : [thdoteo/webdev-boilerplate-project](https://github.com/thdoteo/webdev-boilerplate-project).

###Features

- Apache2
- PHP5 with xdebug, composer, curl, gd, imap, mcrypt
- vim, nodejs, git, python (.py are also executed by apache), ruby
- MailDev
- MySQL and PhpMyAdmin
- Beautiful listing directory with apaxy 
- Modular configuration (at the top of *Vagrantfile*)

###Installation

First you need Git (obviously), Virtualbox and Vagrant.

**1 - Open your terminal and clone this repository.**

	$ git clone https://github.com/thdoteo/boilerplate-webdev-vm.git yourvmname

**2 - Go inside "yourvmname" directory.**

	$ cd yourvmname

**3 - Configure by editing Vagrantfile.**

You have to change the configuration (name, ip, timezone, webpath...) at the top of Vagrantfile.

**4 - Install vagrant-hostmanager.**

	$ vagrant plugin install vagrant-hostmanager

**5 - Launch the vm.**

	$ vagrant up

**6 - Wait for a loooonnnnng time.**
	
Follow the instruction written on your terminal. You can now access to your vm via ssh with :

	$ vagrant ssh

To shutdown the vm type this :

	$ vagrant halt

Finally you can launch the vm with :

	$ vagrant up 