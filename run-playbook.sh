#!/bin/bash

if [ -n "$1" ]; then
  AHOSTNAME=$1
else
  unset AHOSTNAME
  read -p "Enter hostname: " AHOSTNAME
fi
echo "$AHOSTNAME" >inventory.tmp

ping $AHOSTNAME -c 1
if [ $? != 0 ]; then
  echo "Cannot reach $AHOSTNAME"
  exit 1
fi

ansible -i inventory.tmp -m ping -u pi -b all
if [ $? != 0 ]; then
  echo "Cannot run ansible on host $AHOSTNAME"
  exit 1
fi

unset PLAYBOOK
read -p "Enter playbook: " PLAYBOOK

if [[ -f "$PLAYBOOK.yml" ]]; then
  ansible-playbook -i inventory.tmp -u pi "$PLAYBOOK.yml"
else
  echo "$PLAYBOOK does not exist"
  exit 1
fi

rm inventory.tmp
