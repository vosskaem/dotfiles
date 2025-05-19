#!/bin/sh
curl -sSfLO https://github.com/sxyazi/yazi/releases/download/nightly/yazi-x86_64-unknown-linux-musl.zip
unzip yazi-x86_64-unknown-linux-musl.zip
cd yazi-x86_64-unknown-linux-musl
cp ya yazi /usr/local/bin/
cp completions/ya.bash completions/yazi.bash /etc/bash_completion.d/

