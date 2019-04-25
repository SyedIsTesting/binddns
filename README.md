# binddns
Run the 1_install_bind_server file as root
copy named.conf to /etc/named.conf
edit /etc/named.conf and update the ip address and subnets to the correct ones and the zone
copy db.hassnat.co.uk to /var/named/data/db.hassnat.co.uk and rename it to db.zonename
edit db.zonename to update the correct zone information
edit 2_finalise_bind_server and add the correct information thats previously been configured and run
run 3_update_bind_client on the client servers to securely update dns.  This will need to be done once when provisioned

