#!/bin/bash -e

sed -i s@/deb.debian.org/@/mirrors.aliyun.com/@g /etc/apt/sources.list
apt-get update && apt-get upgrade -y
# install libgdiplus for images opreation
apt-get install -y libgdiplus && apt-get clean && ln -s /usr/lib/libgdiplus.so /usr/lib/gdiplus.dll
# install wget to download jexus, curl for healthcheck.
apt-get install -y --no-install-recommends curl ca-certificates procps
curl --location --output jexus-6.2.x-x64.tar.gz https://linuxdot.net/down/jexus-6.2.x-x64.tar.gz
tar -zxf jexus-6.2.x-x64.tar.gz && rm jexus-6.2.x-x64.tar.gz
mv jexus /usr/ && cd /usr/jexus && /usr/jexus/jws regsvr
# apt-get remove -y ca-certificates
apt-get autoremove -y
rm -rf /var/lib/apt/lists/*
