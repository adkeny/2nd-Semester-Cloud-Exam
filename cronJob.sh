#!/bin/bash

 0 0 * * * /usr/bin/uptime > /var/log/uptime_check.log 2>&1
