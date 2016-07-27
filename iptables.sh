#! /bin/bash
#default iptables rules for IDC 
#create by 4lan5 2015-11-20





IF="eth0"

#清除规则
/sbin/iptables -F 
/sbin/iptables -X 
/sbin/iptables -Z 

# 预定义策略
/sbin/iptables -A INPUT -s 127.0.0.1 -j ACCEPT  # 允许回环接口可以被访问
/sbin/iptables -P INPUT   DROP # 默认是拒绝访问
/sbin/iptables -P OUTPUT  ACCEPT  # 允许本机访问其他机器，无限制 
/sbin/iptables -A INPUT -m state --state ESTABLISHED,RELATED -j ACCEPT 
/sbin/iptables -A INPUT -p icmp -j ACCEPT # 允许ping


#允许的本机服务
/sbin/iptables -A INPUT -p TCP -i $IF --dport 22 -j ACCEPT        # SSH 
#/sbin/iptables -A INPUT -p TCP -i $IF --dport  3306 -j ACCEPT        # mysql
#/sbin/iptables -A INPUT -p TCP -i $IF --dport  80 -j ACCEPT        # web

# 黑名单
#/sbin/iptables -A INPUT -s 1.1.1.0/24 -j DROP
#/sbin/iptables -A INPUT -s 1.1.1.0 -j DROP

# 信任的网络和IP
/sbin/iptables -A INPUT -s 10.0.0.1/24 -j ACCEPT # 信任的网络
/sbin/iptables -A INPUT -s 10.0.1.1/24 -j ACCEPT # 信任的网络

#/sbin/iptables -A INPUT -s 1.1.1.1  -j ACCEPT # 信任的ip
