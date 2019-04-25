#!/bin/bash
chown named:named /var/named/data/db.hassnat.co.uk
semanage fcontext -a -t named_zone_t /var/named/data/db.hassnat.co.uk
restorecon -Rv /var/named/
setsebool -P named_write_master_zones=1
named-checkconf /etc/named.conf
named-checkzone db.hassnat.co.uk /var/named/data/db.hassnat.co.uk