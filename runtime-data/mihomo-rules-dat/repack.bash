#!/bin/bash

set -eo pipefail

TZ=UTC

mkdir -pv mihomo-rules-dat-$(date +%Y%m%d)
cd mihomo-rules-dat-$(date +%Y%m%d)

for i in \
    country-lite.mmdb \
    country.mmdb \
    geoip-lite.dat \
    geoip-lite.db \
    geoip-lite.metadb \
    geoip.dat \
    geoip.db \
    geoip.metadb \
    GeoLite2-ASN.mmdb \
    geosite-lite.dat \
    geosite-lite.db \
    geosite.dat \
    geosite.db; do
	wget \
	    https://github.com/MetaCubeX/meta-rules-dat/releases/download/latest/$i \
	    -O $i
	wget \
	    https://github.com/MetaCubeX/meta-rules-dat/releases/download/latest/$i.sha256sum \
	    -O $i.sha256sum
	sha256sum -c $i.sha256sum
	rm -v $i.sha256sum
done

cd ..

tar cvfJ mihomo-rules-dat-$(date +%Y%m%d).tar.xz mihomo-rules-dat-$(date +%Y%m%d)
