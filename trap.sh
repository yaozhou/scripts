#!/bin/sh

errtrap() {
	echo "about to execute line: $1"
	exec 
	sh	
}

trap 'echo about exec:$LINENO; exec ; sh' DEBUG

trap 'errtrap $LINENO' DEBUG
id
id


startup menu
iptables 
snmp_handler
config
eject