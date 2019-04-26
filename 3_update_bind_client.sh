#!/bin/bash
zone="hassnat.co.uk"
dnsserver="10.22.113.137"
serverip="$(hostname -I | cut -d" " -f 1)"
hostname="$(cat /proc/sys/kernel/hostname)"
sed -i 's/nameserver.*/nameserver 10.22.113.137/g' /etc/resolv.conf
cat <<EOF > updatedns
server $dnsserver
zone $zone
update add $hostname.$zone 86400 A $serverip
send
EOF
nsupdate -v -k /etc/rndc-dns.key updatedns
