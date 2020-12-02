#!/usr/bin/bash
clear
echo "Install RPI Monitor"

run_cmd(){
    sleep 2
    $1
    if $2; then echo "$1 ok"; else echo "$1 error"; exit 2;fi
}

run_cmd $(echo "Deploy dirmngr") $(sudo apt-get install dirmngr)
run_cmd $(echo "Add public key") $(sudo apt-key adv --recv-keys --keyserver keyserver.ubuntu.com 2C0D3C0F)
run_cmd $(echo "Add RPI Monitor repository") $(sudo wget http://goo.gl/vewCLL -O /etc/apt/sources.list.d/rpimonitor.list)
run_cmd $(echo "Update repositories") $(sudo apt-get update)
run_cmd $(echo "Install RPI Monitor") $(sudo apt-get install -y rpimonitor)
run_cmd $(echo "Update init.d") $(sudo /etc/init.d/rpimonitor update)
run_cmd $(echo "Update auto") $(sudo /etc/init.d/rpimonitor install_auto_package_status_update)