#!/usr/bin/bash

echo -e "Ditribuição Linux..:" $(cat /etc/*-release | grep PRETTY | sed s/"PRETTY_NAME="//g)

echo -e """--> \033[1;32mN E T W O R K\e[0m
\e[100mLocal  IP:\e[49m $(hostname -I | awk '{print $1}')
\e[100mPublic IP:\e[49m $(curl -q https://ipinfo.io/ip)
"""