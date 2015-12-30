#!/bin/sh


check() {
	curl --socks5-hostname localhost:7070 -v youtube.com
	r1=$?

	curl --socks5-hostname localhost:7070 -v twitter.com
	r2=$?

	curl --socks5-hostname localhost:7070 -v google.com
	r3=$?

	curl --socks5-hostname localhost:7070 -v facebook.com
	r4=$?

	if [ "$r1" == "0" -a "$r2" == "0" -a "$r3" == "0" -a "$r4" == "0" ] ; then
		echo "vpn is ok"
	else
		killall ssh
		/home/yao/develop/scripts/ssh_vpn.sh
	fi
}


while [[ TRUE ]]; do
	check() 
	sleep 60
done
