#!/bin/bash

# this need to be run in root because it is using port 80

# for localhost development, run this only
# hass --config . --open-ui

export PATH=/usr/local/sbin:/usr/local/bin:/usr/sbin:/usr/bin:/sbin:/bin:$PATH

source /home/pi/hass/venv/bin/activate

hass -c /home/pi/hass/conf
