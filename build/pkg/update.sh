#!/bin/bash
set -eux
VERSION=$(curl https://telegram.org/dl/desktop/linux -v 2>&1 | sed -E -n 's/.+?tsetup.(.+?).tar.xz/\1/gp')
sed -E "s/Version: .*$/Version: $VERSION/g" -i telegram/DEBIAN/control
mkdir -p $PWD/telegram/opt
curl https://telegram.org/dl/desktop/linux -L -s | tar xfJ - -C $PWD/telegram/opt
chown 0:0 -R telegram/opt