#!/bin/bash
cat ./build/repo/publickey.txt | apt-key add - ;
echo "deb file:$PWD/build/repo ./" >> /etc/apt/sources.list.d/local.list;
apt-get update;
apt-get install telegram;