##dev-virtualmachine

A development virtual machine that I use with Vagrant to develop and test things.

###Features

- Apache2 (synced to a folder of the host machine)
- PHP5 with xdebug, composer, curl, gd, imap, mcrypt
- vim, nodejs, git, python (.py are also executed by apache), ruby
- MailDev
- MySQL and PhpMyAdmin
- Beautiful listing directory with apaxy 
- Modular configuration (at the top of the *Vagrantfile*)

###Installation

First you need Git (obviously), Virtualbox and Vagrant.

**1 - Open your terminal and clone this repository.**

	$ git clone https://github.com/thdoteo/dev-virtualmachine.git yourvmname

**2 - Go inside "yourvmname" directory.**

	$ cd yourvmname

**3 - Change settings by editing the *Vagrantfile*.**

You can change the configuration (name, ip, timezone, webpath...) at the top of the *Vagrantfile*.

**4 - Install vagrant-hostmanager.**

	$ vagrant plugin install vagrant-hostmanager

**5 - Launch the virtual machine.** (use this later if you want to launch it)

	$ vagrant up

**6 - Wait for a loooonnnnng time.**
	
Follow the instruction written on your terminal. You can now access your virtual machine via ssh with :

	$ vagrant ssh

To shutdown it type this :

	$ vagrant halt