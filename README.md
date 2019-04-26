# binddns
Run the 1_install_bind_server file as root <br>
copy named.conf to /etc/named.conf <br>
edit /etc/named.conf and update the ip address and subnets to the correct ones and the zone <br>
copy db.hassnat.co.uk to /var/named/data/db.hassnat.co.uk and rename it to db.zonename <br>
edit db.zonename to update the correct zone information <br>
edit 2_finalise_bind_server and add the correct information thats previously been configured and run <br>
# clientconfig
copy /etc/rndc.key from bind server to client and place in the same location (this will need automation) <br>
edit 3_update_bind_client and add the bind server ip and zone information (this will be automated in future release) <br>
run 3_update_bind_client on the client servers to securely update dns.  This will need to be done once when provisioned <br>
