#!/bin/sh
usuario="ernesto"
pass="3rn3st0"
base="gatos_caca"

perl -i -p -e "s/\r/\n/g" $1
sed "/[0-9]$/d" $1 | sed "s/,$//" > /tmp/egresos.csv
sed "/,$/d" $1 > /tmp/caca_ingresos.csv
#TODO: Covertir por linea de comandos el archivo de excel a csv http://stackoverflow.com/questions/10557360/convert-xlsx-to-csv-in-linux-command-line
#mysqlimport -u $usuario -p$pass --local $base --fields-terminated-by="," --ignore-lines=1 /tmp/egresos.csv
