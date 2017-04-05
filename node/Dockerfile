FROM centos
MAINTAINER ajitesh

RUN yum -y update 
RUN yum -y install epel-release
RUN yum -y install nodejs npm
RUN npm install -g nodemon

ADD . /src

RUN cd /src
RUN npm install
EXPOSE 8080

CMD ["nodemon", "/src/index.js"]
