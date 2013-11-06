#!/bin/sh
usuario="ernesto"
pass="3rn3st0"
base="gatos_caca"

#mysql -u $usuario -p$pass $base < /Users/ernesto/google_drive/gastos_caca.2013_10_29_08_11_52.sq
mysql -u $usuario -p$pass $base < $1
