#!/usr/bin/bash
clear
echo "Install Jenkins on Raspberry"

run_cmd(){
    sleep 2
    echo $1
    if $2; then echo "$1 ok"; else echo "$1 error"; exit 2;fi
    echo -e "\n"
}

run_cmd "Deploy openjdk11" "sudo apt install -y openjdk-11-jre"
run_cmd "Add key" "wget -q -O - https://pkg.jenkins.io/debian/jenkins.io.key | sudo apt-key add - "
run_cmd "Add repository" "sudo echo -e 'deb https://pkg.jenkins.io/debian binary/' >> /etc/apt/sources.list.d/jenkins.list"
run_cmd "Update repositories" "sudo apt-get update"
run_cmd "Install RPI Monitor" "sudo apt install -y jenkins"