#!/bin/bash
set -e

#installing openfire
    cd /root
    wget https://www.igniterealtime.org/downloadServlet?filename=openfire/openfire-4.2.2-1.x86_64.rpm
    yum -y install *.rpm

#installing sparkweb
#wget http://www.igniterealtime.org/downloadServlet?filename=sparkweb/sparkweb_0_9_0.tar.gz
#mv downloadServlet?filename=sparkweb%2Fsparkweb_0_9_0.tar.gz sparkweb_0_9_0.tar.gz
#tar -xvf sparkweb_0_9_0.tar.gz
#rm sparkweb_0_9_0.tar.gz
#mv sparkweb /usr/share/openfire/plugins/admin/webapp/
#mv /usr/share/openfire/plugins/admin/webapp/sparkweb/SparkWeb.html  /usr/share/openfire/plugins/admin/webapp/sparkweb/index.html
 
 #to clear some data before saving this layer ...a docker image
 #apt-get clean
 #rm -rf /tmp/* /var/tmp/*
 #rm -rf /var/lib/apt/lists/*
