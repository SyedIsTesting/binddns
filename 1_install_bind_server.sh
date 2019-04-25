#!/bin/bash
yum -y install bind bind-utils dos2unix
systemctl enable named
firewall-cmd --permanent --add-port=53/udp
firewall-cmd --permanent --add-port=53/tcp
firewall-cmd --permanent --add-port=953/udp
firewall-cmd --permanent --add-port=953/tcp
firewall-cmd --reload
mkdir /var/log/named
chown named:named /var/log/named
chmod 0700 /var/log/named
rndc-confgen -a -b 512 -r /dev/urandom
chown root:named /etc/rndc.key
chmod 0640 /etc/rndc.key
mv /etc/named.conf /etc/namedoriginal
