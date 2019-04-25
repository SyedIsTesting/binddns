#!/bin/bash
yum -y install bind bind-utils
systemctl enable named
iptables -A INPUT -s 192.168.89.80/28 -p tcp -m state --state NEW --dport 53 -j ACCEPT
iptables -A INPUT -s 192.168.89.80/28 -p udp -m state --state NEW --dport 53 -j ACCEPT
mkdir /var/log/named
chown named:named /var/log/named
chmod 0700 /var/log/named
rndc-confgen -a -b 512 -r /dev/urandom
chown root:named /etc/rndc.key
chmod 0640 /etc/rndc.key
mv /etc/named.conf /etc/namedoriginal