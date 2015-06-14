#!/bin/bash

service apache2 start
service maildev start

echo -e "\n*********"
echo "Vagrant machine '$1' successfully started !"
echo "You can open your web browser on 'http://$3' (ip:$2) which is linked to '$5'."
echo "The password for root, mysql, etc.. is what you have set in the Vagrantfile."
echo "Go to 'http://$3/phpmyadmin' to use PhpMyAdmin."
echo "For more informations go to 'http://github.com/thdoteo/simple-dev-vm'."
echo "*********"