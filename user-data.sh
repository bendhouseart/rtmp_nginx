#! /bin/bash

# update apt repos
sudo apt-get --yes update 
# install dependencies
sudo apt-get --yes install build-essential libpcre3 libpcre3-dev libssl-dev wget unzip curl -y

# collect nginx
sudo wget http://nginx.org/download/nginx-1.15.1.tar.gz

# collect rtmp module for nginx
sudo wget https://github.com/sergey-dryabzhinsky/nginx-rtmp-module/archive/dev.zip

# unzip and untar packages
tar -zxvf nginx-1.15.1.tar.gz
unzip dev.zip

# install nginx and add module
cd nginx-1.15.1
sudo ./configure --with-http_ssl_module --add-module=../nginx-rtmp-module-dev
sudo make
sudo make install


# add rtmp config to server
echo "rtmp {
        server {
                listen 1935;
                chunk_size 4096;

                application live {
                        live on;
                        record off;
                }
        }
}
" | sudo tee -a /usr/local/nginx/conf/nginx.conf
# start server
echo "Starting Server"
sudo /usr/local/nginx/sbin/nginx

