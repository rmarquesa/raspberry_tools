#!/usr/bin/bash

echo -e "Ditribuição Linux..:" $(cat /etc/*-release | grep PRETTY | sed s/"PRETTY_NAME="//g)
echo -e "Sistema Operacional:" 