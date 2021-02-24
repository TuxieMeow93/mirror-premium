#!/bin/bash
today=$(date +%Y-%m-%d--%H-%M--%a)
rm -rf /root/bak/*
zip -r /root/bak/ALLbackup.zip /var/www/html/
rm -rf /var/www/html/backups/*
cp /root/bak/ALLbackup.zip /var/www/html/backups/ALLbackup.zip
