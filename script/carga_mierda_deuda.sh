#!/bin/sh
usuario="ernesto"
pass="3rn3st0"
base="gatos_caca"

script_basedir=$(dirname $0)
file_basename=$(basename $1|cut -d. -f 1)

export LC_CTYPE=C
/Applications/LibreOffice.app/Contents/MacOS/soffice --headless --convert-to csv $1 --outdir /tmp
perl -i -p -e "s/\r/\n/g" /tmp/$file_basename.csv
perl -i -p -e "s/,(\d{2})\/(\d{2})\/(\d{4})\s+(\d{2}:\d{2}[^,]*),/,\3-\2-\1 \4,/" /tmp/$file_basename.csv
mv /tmp/$file_basename.csv /tmp/deudas.csv
mysqlimport -u $usuario -p$pass --local $base --fields-terminated-by="," --ignore-lines=1 /tmp/deudas.csv
