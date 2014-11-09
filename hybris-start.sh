#!/bin/bash
mysql.server start &&\
cd ~/amazeasicsglobal/solr &&\
./solr.sh > /tmp/solr.log 2>&1 &\
cd ~/amazeasicsglobal

if [ "$1" == "ant" ]; then
	. ./setantenv.sh
	if [ "$2" == "up" ]; then
		echo "running ant clean all updatesystem -Dtenant=master"
		ant clean all updatesystem -Dtenant=master > /tmp/ant.log
	else
		echo "running ant clean all" > /tmp/ant.log
		ant clean all
	fi
fi

echo "starting hybris"
nohup ./hybrisserver.sh > /tmp/hybris.log 2>&1
echo "hybris started"
