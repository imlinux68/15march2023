#!/bin/bash

function makedirs() {
echo "1. make dirs"
mkdir -p Networking/{address/{ip,MAC,router},infrastructure/{DNS,port}}

echo "2. rename dns"
mv Networking/infrastructure/DNS Networking/infrastructure/switcher

echo "3. move port to address"
mv Networking/infrastructure/port Networking/address/

tree Networking

echo "4.movve router"
mv Networking/address/router Networking/infrastructure/

echo "5. insert text"
echo "A MAC (Media Access Control) address, sometimes referred to as a hardware
or physical address, is a unique, 12-character alphanumeric attribute that is used
to identify individual electronic devices on a network. An example of a MAC
address is: 00-B0-D0-63-C2-26." > Networking/address/port/whatismac

echo "6. copy wahtismac"
cp Networking/address/port/whatismac Networking/address/MAC/

echo "7. delete from port"
rm -rvf Networking/address/port/whatismac

echo "8. remove networking"
sleep 3
rm -rvf Networking 

}

function readfile() {
cat << EOF > applefile
Apple
banana 
grapes
home
i
like
apple
apple
is
healthy
banana
is
yellow
the
weather
is
beautiful
yaniv
tammy
hala
apple
again
EOF

file=${PWD}/applefile
while IFS= read -r line
	do
		result=$(grep apple)
		echo $result | tr ' ' '\n'
	done < $file

}

