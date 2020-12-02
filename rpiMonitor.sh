#!/usr/bin/bash

echo "Install RPI Monitor"

echo "Deploy dirmngr"
if sudo apt-get install dirmngr > /dev/null; then echo "dirmngr ok"; else echo "dirmngr error"; exit 2; fi

echo "Add public key"
if sudo apt-key adv --recv-keys --keyserver keyserver.ubuntu.com 2C0D3C0F; then echo "Public Key ok"; else echo "Public Key error"; exit 2; fi

echo "Add RPI Monitor repository"
if sudo wget http://goo.gl/vewCLL -O /etc/apt/sources.list.d/rpimonitor.list; then echo "Repository ok"; else echo "Repository error"; exit 2; fi

echo "Update repositories"
if sudo apt-get update > /dev/nul; then echo "Update ok"; else echo "Update error"; exit 2; fi

echo "Install RPI Monitor"
if sudo apt-get install rpimonitor; then echo "Deploy ok"; else echo "Deploy error"; exit 2; fi