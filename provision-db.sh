#!/bin/bash

echo "******************************"
echo "Provisioning DB..."
echo "******************************"

echo "*** Installing MongoDB ***"
sudo apt-key adv --keyserver hkp://keyserver.ubuntu.com:80 --recv EA312927
echo "deb http://repo.mongodb.org/apt/ubuntu trusty/mongodb-org/3.2 multiverse" | sudo tee /etc/apt/sources.list.d/mongodb-org-3.2.list
sudo apt-get update
sudo apt-get install -y mongodb-org=3.2.6 mongodb-org-server=3.2.6 mongodb-org-shell=3.2.6 mongodb-org-mongos=3.2.6 mongodb-org-tools=3.2.6
echo "mongodb-org hold" | sudo dpkg --set-selections
echo "mongodb-org-server hold" | sudo dpkg --set-selections
echo "mongodb-org-shell hold" | sudo dpkg --set-selections
echo "mongodb-org-mongos hold" | sudo dpkg --set-selections
echo "mongodb-org-tools hold" | sudo dpkg --set-selections
sudo service mongod stop
sudo cp /srv/config/mongod.conf /etc/mongod.conf
sudo service mongod start

echo "*** Setup Firewall ***"
sudo iptables-restore -c < /srv/config/iptables.rules
echo "y" | sudo ufw enable

echo "******************************"
echo "Provisioning DB...Success! "
echo "******************************"