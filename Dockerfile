#tcserver
FROM centos
#Maintainer details
MAINTAINER ajitesh, ajitesh@gmail.com

RUN yum install wget -y
#installing java
WORKDIR /opt/
RUN wget -nv --no-cookies --no-check-certificate --header "Cookie: gpw_e24=http%3A%2F%2Fwww.oracle.com%2F; oraclelicense=accept-securebackup-cookie" "http://download.oracle.com/otn-pub/java/jdk/8u111-b14/jdk-8u111-linux-x64.rpm"
RUN yum -y localinstall jdk-8u111-linux-x64.rpm
RUN rm jdk-*.rpm
ENV JAVA_HOME /usr/java/jdk1.8.0_111/jre

#INSTALLING tc-server
EXPOSE 8080 6969
RUN rpm --import http://packages.gopivotal.com/pub/rpm/rhel7/app-suite/RPM-GPG-KEY-PIVOTAL-APP-SUITE-EL7
RUN yum-config-manager --add-repo http://packages.pivotal.io/pub/rpm/rhel7/app-suite/x86_64
RUN yum install pivotal-tc-server-standard-3.2.1-RELEASE -y
WORKDIR /home/user/
RUN mkdir -p /web/tcserver
RUN /opt/pivotal/pivotal-tc-server-standard/tcruntime-instance.sh create -i /web/tcserver jenkins
ADD jenkins.war /web/tcserver/jenkins/webapps/

RUN /web/tcserver/jenkins/bin/./tcruntime-ctl.sh start /web/tcserver/jenkins
#CMD /web/tcserver/01/bin/tcruntime-ctl.sh start && tail -f /web/tcserver/01/logs/catalina.out
