#!/bin/sh

echo "Setting up kesnerwalter for the first time"

sudo apt-get update
sudo apt-get upgrade -y

sudo apt-get install git -y

if [ ! -d /vagrant/ops ]
then
    sudo mkdir /vagrant/ops
fi


git clone git@github.com:kesnerwalter/ops-ubuntu.git /vagrant/ops/ops-ubuntu

/vagrant/ops/ops-ubuntu/vagrant/setup.sh
/vagrant/ops/ops-ubuntu/vagrant/setup-apache.sh
/vagrant/ops/ops-ubuntu/vagrant/setup-php.sh
/vagrant/ops/ops-ubuntu/vagrant/setup-mysql.sh

sudo service apache2 restart

echo "Installing the main site
"
if [ ! -d /vagrant/code ]
then
    sudo mkdir /vagrant/code
fi

git clone git@github.com:kesnerwalter/kesnerwalter.git /vagrant/code/kesnerwalter

exit 0
