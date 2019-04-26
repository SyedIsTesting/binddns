#!/bin/bash
wget https://github.com/SyedIsTesting/binddns/blob/master/rndc.key -P /etc
keyvalue="$(az keyvault secret show --name "rndc-key" --vault-name "CustomerKV1" --query value)"
sed -i "s|secret.*|${myString}secret $keyvalue;|g" /etc/rndc.key
serverip="$(hostname -I | cut -d" " -f 1)"
hostname="$(cat /proc/sys/kernel/hostname)"
zone="hassnat.co.uk"
sed -i 's/nameserver.*/nameserver 10.22.113.137/g' /etc/resolv.conf
cat <<EOF > updatedns
server 10.22.113.137
zone $zone
update add $hostname.$zone 86400 A $serverip
send
EOF
nsupdate -v -k /etc/rndc.key updatedns
