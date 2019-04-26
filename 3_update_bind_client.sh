#!/bin/bash
zone="hassnat.co.uk"
keyvalue="$(az keyvault secret show --name "rndc-key" --vault-name "CustomerKV1" --query value)"
dnsserver="10.22.113.137"
wget https://github.com/SyedIsTesting/binddns/blob/master/rndc-dns.key -P /etc
sed -i "s|secret.*|${myString}secret $keyvalue;|g" /etc/rndc-dns.key
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
