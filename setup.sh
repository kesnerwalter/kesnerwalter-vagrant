#!/bin/sh

echo "Setting up kesnerwalter for the first time"

sudo apt-get update
sudo apt-get upgrade -y

sudo apt-get install git -y

git clone git@github.com:kesnerwalter/ops-ubuntu.git /vagrant/ops-ubuntu

/vagrant/ops-ubuntu/vagrant/setup.sh
/vagrant/ops-ubuntu/vagrant/setup-apache.sh
/vagrant/ops-ubuntu/vagrant/setup-php.sh
/vagrant/ops-ubuntu/vagrant/setup-mysql.sh

sudo service apache2 restart

exit 0
