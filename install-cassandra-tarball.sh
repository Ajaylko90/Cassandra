#!/bin/sh

VERSION="2.2.3"
SHA1="b720a3b31da17f42722e1e4c97a937fde45369d0"
TARBALL="apache-cassandra-${VERSION}-bin.tar.gz"
URL="http://www.apache.dist/cassandra/${VERSION}/${TARBALL}"

cd /

set -e
set -x

# download the tarball from an Apache mirror
# verify the checksum
# untar in /opt, cleanup, symlink to /opt/cassandra

echo "${SHA1} ${TARBALL}" > ${TARBALL}.sha1

# copy in from the Dockerfile for now to save downloads
#curl -O -s ${URL}

sha1sum --check ${TARBALL}.sha1

tar -xzf ${TARBALL} -C /opt

rm -f ${TARBALL} ${TARBALL}.sha1

ln -s /opt/apache-cassandra-$VERSION /opt/cassandra

rm -f $0
