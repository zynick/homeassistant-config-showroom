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
HTML="<html><head><meta http-equiv=\"refresh\" content=\"0; url=$URL\"><meta http-equiv=\"pragma\" content=\"no-cache\"><meta http-equiv=\"expires\" content=\"-1\"></head></html>"
echo $HTML > /var/tmp/showroom.html

# Upload Redirect HTML to website
curl -u $FTP_USER:$FTP_PASS -T /var/tmp/showroom.html ftp://$FTP_HOST
