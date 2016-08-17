#!/bin/bash

service apache2 start
service maildev start

echo -e "\n"
echo "********"
echo "Hurrah ! Virtual machine '$1' successfully started!"
echo "'$3' = $2, apache linked to '$4', phpmyadmin -> 'http://$3/phpmyadmin', maildev -> 'http://$3:1080'"
echo "Settings are in the Vagrantfile. For more informations go to 'http://github.com/thdoteo/webDevelopmentVirtualmachine'."