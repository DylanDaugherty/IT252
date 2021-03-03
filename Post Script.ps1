#!/bin/bash
Sudo apt update
sudo apt install apache2

invoke-AzVMrunCommand

ssh user@serverip 'sudeo apt update && sudo apt install apche2'