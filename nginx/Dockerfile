FROM centos

MAINTAINER ajitesh

RUN yum install -y epel-release && yum install -y nginx && yum install -y wget net-tools dialog

ADD nginx.conf /etc/nginx/

RUN echo "daemon off;" >> /etc/nginx/nginx.conf

ENTRYPOINT 
EXPOSE 80
CMD systemctl start nginx
#CMD [ "/usr/sbin/nginx" ]
