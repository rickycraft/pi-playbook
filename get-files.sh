#!/bin/bash

if [[ -d "files" ]]; then
  rm -rf files
fi

scp -r -P 222 -i /home/rick/.ssh/id_rsa root@192.168.1.220:/volume1/veeam/raspi/ files
chmod -R 755 files
