##webDevelopmentVirtualmachine

A Vagrant Virtual machine that I use to develop with web technologies.

###Features

- Debian 7.2
- Apache2 (synced to a folder of the host machine)
- PHP5 with xdebug, composer, curl, gd, imap, mcrypt
- vim, nodejs, npm, git, ruby
- MailDev
- MySQL and PhpMyAdmin
- Beautiful listing directory with Apaxy 
- Modular configuration (at the top of the *Vagrantfile*)

###Usage

First you need Git (obviously), Virtualbox and Vagrant.

**1 - Open your terminal and clone this repository.**

	$ git clone https://github.com/thdoteo/webDevelopmentVirtualmachine.git thenameofyourvirtualmachine

**2 - Go inside "thenameofyourvirtualmachine" directory.**

	$ cd thenameofyourvirtualmachine

**3 - Change settings by editing the *Vagrantfile*.**

You can change the configuration (name, ip, timezone, apachefolder...) at the top of the *Vagrantfile*.

**4 - Install vagrant-hostmanager.**

	$ vagrant plugin install vagrant-hostmanager

**5 - Launch the virtual machine.** (use this later if you want to launch it)

	$ vagrant up

**6 - Wait for a loooonnnnng time.**
	
Follow the instructions written on your terminal. You can now access your virtual machine via SSH with :

	$ vagrant ssh

To shutdown your virtual machine type this :

	$ vagrant halt

###Contribute

Don't hesitate to improve the code and ask for a pull request, even small ones. I would be delighted to see other people taking part in this project :-).