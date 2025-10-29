echo "Injecting runtime environment variables..."

# Replace placeholder in the built JS bundle
for file in /usr/share/nginx/html/static/js/*.js; do
  sed -i "s|__REACT_APP_API_URL__|${REACT_APP_API_URL}|g" $file
done
