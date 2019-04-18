#!/usr/bin/env bash
# Update packages
echo "Running yum update..."
yum -y update
yum -y install epel-release yum-utils
# need to update git for bigbucket
sudo yum -y install  https://centos7.iuscommunity.org/ius-release.rpm
sudo yum -y install  git2u-all
# temp use postgresql
yum -y install postgresql-server postgresql-contrib
postgresql-setup initdb
systemctl start postgresql
systemctl enable postgresql
# prepare files for install
chmod a+x /vagrant/atlassian*.bin

setenforce 0
echo "192.168.33.16"
