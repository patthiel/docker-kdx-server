#!/bin/bash

wget $KDX_SERVER_DOWNLOAD_URL

unzip -jq /app/KDXServer1620-Lnx.zip -d /app 2>&1 > /dev/null

chmod +x /app/KDXServer.lexe
