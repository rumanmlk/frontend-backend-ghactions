#!/bin/sh
for i in $(env | grep APP_)
do
    value=$(echo $i | cut -d '=' -f 2-)
    
    find /usr/share/nginx/html -type f -name '*.js' -exec sed -i "s|${value}|${REACT_APP_API_URL}|g" '{}' +
done
