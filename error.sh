#!/bin/bash

STATE=`curl -I -m 10 -o /dev/null -s -w %{http_code} www.cx930.net`

if [[ "$STATE" -eq "502" ]]; then
	service nginx restart
elif [[ "$STATE" -ne "502" ]] && [[ "$STATE" -ne "200" ]]; then
	service nginx restart
	service mysqld restart
	service php-fpm restart
	service memcached restart
fi
