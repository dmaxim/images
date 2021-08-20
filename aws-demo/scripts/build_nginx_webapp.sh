#!/bin/bash -x

apt-get update
apt-get install -y build-essential

wget https://nginx.org/download/nginx-1.19.0.tar.gz
tar zxf nginx-1.19.0.tar.gz
cd nginx-1.19.0

./configure \
--sbin-path=/usr/local/bin/nginx \
--conf-path=/var/globoticket/nginx.conf \
--pid-path=/usr/local/nginx/nginx.pid \
--without-http_rewrite_module \
--without-http_gzip_module

make
make install

if [[ ! -z "${SECRET_ARTIST_NAME}" ]]; then 
	sed -i "s/HIDDEN_ARTIST/${SECRET_ARTIST_NAME}/g" /var/globoticket/Code/catalog.html
fi

systemctl enable nginx.service
systemctl start nginx.service
