echo "Injecting runtime environment variables..."

for file in /usr/share/nginx/html/static/js/*.js; do
  sed -i "s|__REACT_APP_API_URL__|${REACT_APP_API_URL}|g" $file
done
