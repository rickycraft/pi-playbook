#!/bin/bash

if [[ -d "files" ]]; then
  rm -rf files
fi

scp -r -P 222 -i /home/rick/.ssh/id_rsa root@srvnas.roveri.local:/volume1/veeam/raspi/ files
chmod -R 755 files
