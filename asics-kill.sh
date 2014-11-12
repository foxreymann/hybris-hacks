#!/bin/bash
ps -ef | grep -i hybris | awk '{print $2}' | xargs kill -9
ps -ef | grep -i solr | awk '{print $2}' | xargs kill -9
mysql.server stop 
