#!/bin/sh
# VERSION=2.0.11
# curl -sSfLO https://github.com/IsmaelMartinez/teams-for-linux/releases/download/v${VERSION}/teams-for-linux_${VERSION}_amd64.deb
# apt install ./teams-for-linux_${VERSION}_amd64.deb

sudo mkdir -p /etc/apt/keyrings
sudo wget -qO /etc/apt/keyrings/teams-for-linux.asc https://repo.teamsforlinux.de/teams-for-linux.asc
sh -c 'echo "Types: deb\nURIs: https://repo.teamsforlinux.de/debian/\nSuites: stable\nComponents: main\nSigned-By: /etc/apt/keyrings/teams-for-linux.asc" | sudo tee /etc/apt/sources.list.d/teams-for-linux-packages.sources'
sudo apt update
sudo apt install teams-for-linux

