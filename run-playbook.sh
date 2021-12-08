#!/bin/sh

unset AHOSTNAME
read -p "Enter hostname: " AHOSTNAME
echo "$AHOSTNAME" >inventory.tmp

ansible-playbook -i inventory.tmp playbook.yaml

rm inventory.tmp
