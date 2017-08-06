#!/bin/bash

echo "Starting cron..." >> /var/log/cron-runner.log
cron && tail -f /var/log/cron-runner.log
