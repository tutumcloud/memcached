#!/bin/bash

#create admin account to memcached using SASL
if [ ! -f /.memcached_admin_created ]; then
	/create_memcached_admin_user.sh
fi

dbgflg=${MEMCACHED_DEBUG:-""}

memcached $dbgflg -u root -S  -l 0.0.0.0
