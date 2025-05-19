#!/bin/sh
rm eza_x86_64-unknown-linux-gnu.tar.gz
curl -sSfLO https://github.com/eza-community/eza/releases/latest/download/eza_x86_64-unknown-linux-gnu.tar.gz
tar xzf eza_x86_64-unknown-linux-gnu.tar.gz
chown root:root eza
mv eza /usr/local/bin/
