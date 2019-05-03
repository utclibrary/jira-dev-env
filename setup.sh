#!/usr/bin/env bash
# Update packages
echo "Running yum update..."
yum -y update
yum -y install epel-release yum-utils wget curl vim
# install Java JDK for Crowd requirement
# yum -y localinstall jdk-8u162-linux-x64.rpm
# install latest git
yum -y install  https://centos7.iuscommunity.org/ius-release.rpm
yum -y install  git2u-all
# nginx https://confluence.atlassian.com/confkb/how-to-use-nginx-to-proxy-requests-for-confluence-313459790.html
yum -y install nginx
systemctl start nginx
systemctl enable nginx
systemctl status nginxcd cd
#sudo firewall-cmd --permanent --zone=public --add-service=http
#sudo firewall-cmd --permanent --zone=public --add-service=https
#sudo firewall-cmd --reload
# open ports for all Jira services installed
# START MySQL 5.7 install
yum -y localinstall https://dev.mysql.com/get/mysql57-community-release-el7-11.noarch.rpm
yum -y install mysql-community-server
# additional changes so that jira will be able to connect
cp -rf my.cnf /etc/
systemctl enable mysqld
systemctl start mysqld
systemctl status mysqld
# END MySQL 5.7 install
# prepare files for install
chmod a+x /vagrant/atlassian*.bin
echo "run following"
echo "vagrant ssh"
echo "cd /vagrant/"
echo "sudo ./{prefered bin file} (using defaults)"
echo "copy /vagrant/mysql-connector-java-*-bin.jar to /opt/atlassian/<Jira|Confluence>/lib/"
echo "copy /vagrant/mysql-connector-java-*-bin.jar to /var/atlassian/application-data/bitbucket/lib/"
echo "restart jira - from <install directory>/bin/"
echo "sudo <install directory>/bin/stop-jira.sh"
echo "sudo <install directory>/bin/start-jira.sh"
setenforce 0
echo "192.168.33.16"
#https://confluence.atlassian.com/confkb/how-to-use-nginx-to-proxy-requests-for-confluence-313459790.html
#/etc/nginx/nginx.conf
