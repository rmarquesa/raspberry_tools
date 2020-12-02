#!/usr/bin/bash
clear
echo "Install RPI Monitor"

sleep 2
echo "Deploy dirmngr"
if sudo apt-get install dirmngr > /dev/null; then echo "dirmngr ok"; else echo "dirmngr error"; exit 2; fi

sleep 2
echo "Add public key"
if sudo apt-key adv --recv-keys --keyserver keyserver.ubuntu.com 2C0D3C0F > /dev/null; then echo "Public Key ok"; else echo "Public Key error"; exit 2; fi

sleep 2
echo "Add RPI Monitor repository"
if sudo wget http://goo.gl/vewCLL -O /etc/apt/sources.list.d/rpimonitor.list > /dev/null; then echo "Repository ok"; else echo "Repository error"; exit 2; fi

sleep 2
echo "Update repositories"
if sudo apt-get update > /dev/null; then echo "Update ok"; else echo "Update error"; exit 2; fi

sleep 2
echo "Install RPI Monitor"
if sudo apt-get install -y rpimonitor > /dev/null; then echo "Deploy ok"; else echo "Deploy error"; exit 2; fi