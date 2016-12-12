#!/bin/bash

FTP_HOST="ftp.smartboxasia.com"
FTP_USER="sbacom@smartboxasia.com"
FTP_PASS="$7E_wE6x3Ra$"


# Export Path
# export PATH=/usr/local/sbin:/usr/local/bin:/usr/sbin:/usr/bin:/sbin:/bin:$PATH

# Start ngrok
ngrok http -region ap 80

# Generate Redirect HTML
URL="$(curl -s localhost:4040/api/tunnels | jq -r '.tunnels[1].public_url')"
HTML="<html><head><meta HTTP-EQUIV=\"REFRESH\" content=\"5; url=$URL\"></head><body><h1>hello</h1></body></html>"
echo $HTML > showroom.html

# Upload Redirect HTML to website
curl -u '$FTP_USER:$FTP_PASS' -T showroom.html ftp://$FTP_HOST