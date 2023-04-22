systemctl stop firewalld

iptables -F;iptables -X

iptables -P INPUT DROP
iptables -P OUTPUT DROP
