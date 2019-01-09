#!/bin/bash

### Usage ###
cd /data/wallet.eos
curl https://eosnodes.privex.io/?config=1 |awk '{print $3}' > list


cmd="eos/build/programs/cleos/cleos -u http://127.0.0.1:12034"
cat list |  \
while read line
do  
	$cmd net connect $line
done
$cmd get info
$cmd net peers |grep peer
