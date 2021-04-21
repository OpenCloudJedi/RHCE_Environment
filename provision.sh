#!/bin/bash
printf "%s" "waiting for iss1 ..."
while ! timeout 0.2 ping -c 1 -n 192.168.2.3 &> /dev/null
do
    printf "%c" "."
done
printf "%s" "waiting for iss2 ..."
while ! timeout 0.2 ping -c 1 -n 192.168.2.4 &> /dev/null
do
    printf "c" "."
done
printf "%s" "waiting for iss3 ..."
while ! timeout 0.2 ping -c 1 -n 192.168.2.5 &> /dev/null
do
    printf "c" "."
done
printf "%s" "waiting for iss4 ..."
while ! timeout 0.2 ping -c 1 -n 192.168.2.6 &> /dev/null
do
    printf "%c" "."
done
printf "%s" "waiting for iss5 ..."
while ! timeout 0.2 ping -c 1 -n 192.168.2.7 &> /dev/null
do
    printf "%c" "."
done
printf "%s" "waiting for control ..."
while ! timeout 0.2 ping -c 1 -n 192.168.2.3 &> /dev/null
do
    printf "%c" "."
done
printf "\n%s\n"  "Cleared to proceed with mission"
sleep 10 
ansible-playbook -i /vagrant/inventory /vagrant/playbooks/provision.yml
