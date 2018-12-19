#!/bin/bash

### Usage ###
# ./get_eth_nodes.sh <json | strings>
# Use json to get an array of nodes in JSON suitable for Parity
# Use strings to get a list of nodes line by line
#############
yum install -y jq


ARRAY=()
NODES=`curl -s 'https://www.ethernodes.org/network/1/data?draw=1&columns%5B0%5D%5Bdata%5D=id&columns%5B0%5D%5Bname%5D=&columns%5B0%5D%5Bsearchable%5D=true&columns%5B0%5D%5Borderable%5D=true&columns%5B0%5D%5Bsearch%5D%5Bvalue%5D=&columns%5B0%5D%5Bsearch%5D%5Bregex%5D=false&columns%5B1%5D%5Bdata%5D=host&columns%5B1%5D%5Bname%5D=&columns%5B1%5D%5Bsearchable%5D=true&columns%5B1%5D%5Borderable%5D=true&columns%5B1%5D%5Bsearch%5D%5Bvalue%5D=&columns%5B1%5D%5Bsearch%5D%5Bregex%5D=false&columns%5B2%5D%5Bdata%5D=port&columns%5B2%5D%5Bname%5D=&columns%5B2%5D%5Bsearchable%5D=true&columns%5B2%5D%5Borderable%5D=true&columns%5B2%5D%5Bsearch%5D%5Bvalue%5D=&columns%5B2%5D%5Bsearch%5D%5Bregex%5D=false&columns%5B3%5D%5Bdata%5D=country&columns%5B3%5D%5Bname%5D=&columns%5B3%5D%5Bsearchable%5D=true&columns%5B3%5D%5Borderable%5D=true&columns%5B3%5D%5Bsearch%5D%5Bvalue%5D=&columns%5B3%5D%5Bsearch%5D%5Bregex%5D=false&columns%5B4%5D%5Bdata%5D=clientId&columns%5B4%5D%5Bname%5D=&columns%5B4%5D%5Bsearchable%5D=true&columns%5B4%5D%5Borderable%5D=true&columns%5B4%5D%5Bsearch%5D%5Bvalue%5D=&columns%5B4%5D%5Bsearch%5D%5Bregex%5D=false&columns%5B5%5D%5Bdata%5D=client&columns%5B5%5D%5Bname%5D=&columns%5B5%5D%5Bsearchable%5D=true&columns%5B5%5D%5Borderable%5D=true&columns%5B5%5D%5Bsearch%5D%5Bvalue%5D=&columns%5B5%5D%5Bsearch%5D%5Bregex%5D=false&columns%5B6%5D%5Bdata%5D=clientVersion&columns%5B6%5D%5Bname%5D=&columns%5B6%5D%5Bsearchable%5D=true&columns%5B6%5D%5Borderable%5D=true&columns%5B6%5D%5Bsearch%5D%5Bvalue%5D=&columns%5B6%5D%5Bsearch%5D%5Bregex%5D=false&columns%5B7%5D%5Bdata%5D=os&columns%5B7%5D%5Bname%5D=&columns%5B7%5D%5Bsearchable%5D=true&columns%5B7%5D%5Borderable%5D=true&columns%5B7%5D%5Bsearch%5D%5Bvalue%5D=&columns%5B7%5D%5Bsearch%5D%5Bregex%5D=false&columns%5B8%5D%5Bdata%5D=lastUpdate&columns%5B8%5D%5Bname%5D=&columns%5B8%5D%5Bsearchable%5D=true&columns%5B8%5D%5Borderable%5D=true&columns%5B8%5D%5Bsearch%5D%5Bvalue%5D=&columns%5B8%5D%5Bsearch%5D%5Bregex%5D=false&order%5B0%5D%5Bcolumn%5D=0&order%5B0%5D%5Bdir%5D=asc&start=0&length=100&search%5Bvalue%5D=&search%5Bregex%5D=false&_=1528093816442'`

for row in $(echo "${NODES}" | jq -r '.data[] | @base64'); do
    _jq() {
     echo ${row} | base64 --decode | jq -r ${1}
    }

    ARRAY+=(admin.addPeer\(\""enode://"$(_jq '.id')"@"$(_jq '.host')":"$(_jq '.port')\"\)\;)
done
> list
if [ "$1" == "json" ]
then
   printf '%s\n' "${ARRAY[@]}" | jq -R . | jq -s -c . |egrep -v '.com|.net|your-server.de'  >> list
else
   printf '%s\n' "${ARRAY[@]}" |egrep -v '.com|.net|your-server.de' >> list
fi

cat list |  \
while read line
do  
	./geth-linux-amd64-1.8.6-12683fec/geth  attach ./geth-linux-amd64-1.8.6-12683fec/data/geth.ipc  --exec $line
done

	./geth-linux-amd64-1.8.6-12683fec/geth  attach ./geth-linux-amd64-1.8.6-12683fec/data/geth.ipc  --exec admin.peers
	./geth-linux-amd64-1.8.6-12683fec/geth  attach ./geth-linux-amd64-1.8.6-12683fec/data/geth.ipc  --exec eth.syncing
	./geth-linux-amd64-1.8.6-12683fec/geth  attach ./geth-linux-amd64-1.8.6-12683fec/data/geth.ipc  --exec eth.blockNumber
