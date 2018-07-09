#!/bin/bash

sudo certbot --nginx -d $domain -d $domain
sudo echo "15 3 * * * /usr/bin/certbot renew --quiet">> /var/spool/cron/crontabs/root
