#!/bin/bash

for ip in  $(seq 1 254)
do
	ping -c 3 192.168.1.$ip > /dev/null
	if [ $? -eq 0 ]; then
		echo "192.168.1.$ip is UP"	
	fi
done
