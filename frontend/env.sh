#!/bin/sh
for i in $(env | grep APP_)
do    
    # sed JS and CSS only
    find /usr/share/nginx/html -type f -name '*.js' -exec sed -i "s|__REACT_APP_API_URL__|${REACT_APP_API_URL}|g" '{}' +
done
echo 'done'
