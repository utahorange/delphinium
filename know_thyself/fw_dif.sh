# !/bin/bash
iptables -F; iptables -X

# INPUT
iptables -P INPUT DROP
iptables -A INPUT -m conntrack --ctstate RELATED,ESTABLISHED -j ACCEPT
iptables -A INPUT -s 127.0.0.1,$LOCALNETWORK -m conntrack --ctstate NEW -j ACCEPT
iptables -A INPUT -p tcp -m multiport --dports $SCOREDPORTS -m conntrack --ctstate NEW -j ACCEPT

# OUTPUT
iptables -P OUTPUT DROP; iptables -P FORWARD ACCEPT
#iptables -A OUTPUT -s <ip of ccs scoring server> -j ACCEPT

iptables -A OUTPUT -m conntrack --ctstate RELATED,ESTABLISHED -j ACCEPT
iptables -A OUTPUT -d 127.0.0.1,$LOCALNETWORK -m conntrack --ctstate NEW -j ACCEPT
iptables -A OUTPUT -p udp --dport 53 -j ACCEPT

# misc
ufw disable
systemctl disable firewalld
#install iptables-legacy
echo "remember to turn off/on links - ip link set <int> down"
