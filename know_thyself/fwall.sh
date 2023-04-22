#!/bin/bash
iptables -P INPUT ACCEPT; iptables -P OUTPUT ACCEPT; iptables -P INPUT ACCEPT; iptables -F; iptables -X;

#input 
iptables -A INPUT -p tcp -m multiport --dports $SCOREDPORTS -m conntrack --ctstate NEW -j ACCEPT
iptables -A INPUT -m conntrack --ctstate RELATED,ESTABLISHED -j ACCEPT
iptables -A INPUT -j LOG
#port connections for HOSTED dependencies (i.e. sql server, etc)
iptables -A INPUT -p tcp -m multiport --dports 22,443 -s 127.0.0.1,172.16.4.0/24 -m conntrack --ctstate NEW -j ACCEPT
iptables -P INPUT DROP

#output - has to be opened for ccs client
iptables -A OUTPUT -m conntrack --ctstate RELATED,ESTABLISHED -j ACCEPT
#port connections for NEEDED dependencies
iptables -A OUTPUT -p tcp -m multiport --dports 3306 -d 127.0.0.1,172.16.4.0/24 -m conntrack --ctstate NEW -j ACCEPT
iptables -P FORWARD ACCEPT; iptables -P OUTPUT DROP
