#!/bin/bash

# configuración
user="trabajosedu"
pass="edutrabajos"
url="http://localhost/trabajos/"

url_registro="${url}registro"
url_destino="${url}cron"

file_cookie="/tmp/cookies.txt"
user_agent="Mozilla/5.0 (Windows; U; Windows NT 5.1; en-US; rv:1.8.1.6) Gecko/20070725 Firefox/2.0.0.6"
file_registro="/tmp/reg.html"
file_destino="/tmp/des.html"

#nos logeamos y cogemos la url de la página redirigida
curl -L --silent --keepalive-time 5 \
   --user-agent "${user_agent}" --cookie "${file_cookie}" \
   --cookie-jar "${file_cookie}" \
   -d "loginPro=$user" -d "passwd=$pass"  ${url_registro} > $file_registro


curl -L --silent --keepalive-time 5 \
   --user-agent "${user_agent}" --cookie "${file_cookie}" \
   --cookie-jar "${file_cookie}" \
   ${url_destino}

# rm "$file_cookie" "$file_registro"

exit
