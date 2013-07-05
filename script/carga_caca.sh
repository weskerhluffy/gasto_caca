#!/bin/sh
usuario="ernesto"
pass="3rn3st0"
base="gatos_caca"

script_basedir=$(dirname $0)
file_basename=$(basename $1|cut -d. -f 1)

/Applications/LibreOffice.app/Contents/MacOS/soffice --headless --convert-to csv $1 --outdir /tmp
perl -i -p -e "s/\r/\n/g" /tmp/$file_basename.csv
sed "/[0-9]$/d" /tmp/$file_basename.csv | sed "s/,$//" > /tmp/egresos.csv
sed "/,$/d" /tmp/$file_basename.csv > /tmp/caca_ingresos.csv
mysqlimport -u $usuario -p$pass --local $base --fields-terminated-by="," --ignore-lines=1 /tmp/egresos.csv
$script_basedir/carga_caca.pl /tmp/caca_ingresos.csv
