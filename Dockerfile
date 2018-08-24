#name of container: docker-openfire
#versison of container: 0.3.1
FROM centos:7
MAINTAINER matheuswilliam  "matheuswilliamsilva@icloud.com"

#add repository and update the container
#Installation of nesesary package/software for this containers...
RUN yum install -y vim
RUN yum install -y wget
RUN yum install -y glibc
RUN yum update -y
RUN yum autoremove -y 
RUN rm -rf /tmp/* /var/tmp/*

##startup scripts  
#Pre-config scrip that maybe need to be run one time only when the container run the first time .. using a flag to don't 
#run it again ... use for conf for service ... when run the first time ...
#RUN mkdir -p /etc/my_init.d
#COPY startup.sh /etc/my_init.d/startup.sh
#RUN chmod +x /etc/my_init.d/startup.sh

#pre-config scritp for different service that need to be run when container image is create 
#maybe include additional software that need to be installed ... with some service running ... like example mysqld

COPY pre-conf.sh /sbin/pre-conf
RUN chmod +x /sbin/pre-conf; sync
RUN /sbin/pre-conf 
RUN rm /sbin/pre-conf

##Adding Deamons to containers
# to add openfire deamon to runit

##Nao colocado para executar em teste.##
#RUN mkdir /etc/init.d/openfire
#COPY openfire.sh /etc/init.d/openfire/run
#RUN chmod +x /etc/init.d/openfire/run 

# to allow access from outside of the container  to the container service
# at that ports need to allow access from firewall if need to access it outside of the server. 
EXPOSE 9090 9091 5000:6000/tcp 5000:6000/udp 5222 5269 5223 7443 7777 7070 5229 5275

# Use baseimage-docker's init system.
CMD /etc/init.d/openfire start && bash
