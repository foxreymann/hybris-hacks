#!/bin/bash
mysql.server start
cd ~/amazeasicsglobal/solr
./solr.sh > /tmp/solr.log 2>&1 &
sleep 2
cd ~/amazeasicsglobal

if [ "$1" == "ant" ]; then
	. ./setantenv.sh
	if [ "$2" == "up" ]; then
		echo "running ant clean all updatesystem -Dtenant=master"
		ant clean all updatesystem -Dtenant=master
	else
		echo "running ant clean all"
		ant clean all
	fi
fi

echo "starting hybris"
./hybrisserver.sh
