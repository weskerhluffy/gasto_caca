#!/bin/sh
timestamp=$(date +%Y_%m_%d_%H_%M_%S)

mysqldump -u root -p3rn3st0 gatos_caca > db/gastos_caca.$timestamp.sql
mv db/gastos_caca*.sql ../../google_drive
