#!/bin/sh
rm chezmoi_2.62.2_linux_amd64.deb
curl -sSfLO https://github.com/twpayne/chezmoi/releases/download/v2.62.2/chezmoi_2.62.2_linux_amd64.deb
apt install ./chezmoi_2.62.2_linux_amd64.deb
