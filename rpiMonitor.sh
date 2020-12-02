#!/usr/bin/bash

echo "Install RPI Monitor"

echo "Deploy dirmngr"
if sudo apt-get install dirmngr > /dev/null then
    echo "dirmngr ok"
else
    echo "dirmngr error"
    exit 2
fi

echo "Add public key"
sudo apt-key adv --recv-keys --keyserver keyserver.ubuntu.com 2C0D3C0F
if $? -eq 0 then echo "Public Key ok" else echo "Public Key error" exit 2 fi

echo "Add RPI Monitor repository"
sudo wget http://goo.gl/vewCLL -O /etc/apt/sources.list.d/rpimonitor.list
if $? -eq 0 then echo "Repository ok" else echo "Repository error" exit 2 fi

echo "Update repositories"
sudo apt-get update > /dev/nul
if $? -eq 0 then echo "Update ok" else echo "Update error" exit 2 fi

echo "Install RPI Monitor"
sudo apt-get install rpimonitor
if $? -eq 0 then echo "Deploy ok" else echo "Deploy error" exit 2 fi