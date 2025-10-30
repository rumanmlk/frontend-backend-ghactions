#!/bin/sh
for i in $(env | grep APP_)
do
    key=$(echo $i | cut -d '=' -f 1)
    value=$(echo $i | cut -d '=' -f 2-)
    echo $key=$value
    
    # sed JS and CSS only
    find /usr/share/nginx/html -type f -name '*.js' -exec sed -i "s|__REACT_APP_API_URL__|${REACT_APP_API_URL}|g" '{}' +
done
echo 'done'
