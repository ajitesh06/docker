FROM centos

MAINTAINER ajitesh

# Update the repository and install Redis Server
RUN yum install -y epel-release && yum install -y redis

EXPOSE 6379
#RUN sudo systemctl start  redis.service

#RUN sudo systemctl enable  redis.service

# Run Redis Server
ENTRYPOINT ["/usr/bin/redis-server"]
