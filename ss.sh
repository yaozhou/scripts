iptables -t nat -I SHADOWSOCKS 1 -d 106.186.121.34 -p tcp -j REDIRECT --to-ports 1083

