#!/bin/sh


set -e
set -x

export DEBIAN_FRONTEND=noninteractive

apt-get update
apt-get -y -o Dpkg::Options::='--force-confold' dist-upgrade
apt-get clean
apt-get install -y curl busybox libjna-java python
apt-get clean

rm -f $0
