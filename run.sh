#!/bin/bash

# for localhost development, run this only
# hass --config . --open-ui

export PATH=/usr/local/sbin:/usr/local/bin:/usr/sbin:/usr/bin:/sbin:/bin:$PATH

source /home/pi/hass/venv/bin/activate

# for debugging purpose only
hass -c /home/pi/hass/conf &> /var/log/hass.log
# run this in production
# hass -c /home/pi/hass/conf
