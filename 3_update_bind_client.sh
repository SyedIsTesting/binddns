#!/bin/bash
serverip="$(hostname -I | cut -d" " -f 1)"
hostname="hostname"
zone="hassnat.co.uk"
cat <<EOF > updatedns
server 192.168.89.93
zone $zone
update add $hostname.$zone 86400 A $serverip
send
EOF
nsupdate -v -k /etc/rndc.key updatedns