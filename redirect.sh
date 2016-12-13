#!/bin/bash

FTP_HOST="ftp.smartboxasia.com"
FTP_USER=""
FTP_PASS=""


# Export Path
export PATH=/usr/local/sbin:/usr/local/bin:/usr/sbin:/usr/bin:/sbin:/bin:$PATH

# Restart ngrok in daemon mode
pkill ngrok
ngrok http 80 -region ap > /dev/null &

# Waiting for ngrok to start up
sleep 5

# Generate Redirect HTML
URL="$(curl -s localhost:4040/api/tunnels | jq -r '.tunnels[1].public_url')"
HTML="<html><head><meta HTTP-EQUIV=\"REFRESH\" content=\"0; url=$URL\"></head></html>"
echo $HTML > showroom.html

# Upload Redirect HTML to website
curl -u $FTP_USER:$FTP_PASS -T showroom.html ftp://$FTP_HOST
