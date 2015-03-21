#!/bin/bash

#clear old logs
echo "" > ./logs/vmstat.log
echo "" > ./logs/script.log

#look at the ram usage while testing
vmstat 10 >> ./logs/vmstat.log &
ID=$!

cd swift-runtime

#test docker build
for i in $(seq 250);
do 
	echo "Run $i starts"
	docker build --no-cache=true --force-rm=true --quiet=true .
 	echo -e "Run $i finished\r\n" >> ../logs/script.log
done

#really? no crash? okay let's kill the ram logging!
kill $ID
