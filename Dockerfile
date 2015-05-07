# DOCKER HACKING
#
# VERSION 0.1
#
# build with: sudo docker build -t testx .

FROM centos:7

MAINTAINER James Shubin <james@shubin.ca>

#RUN yum update -y
RUN echo Hello from purpleidea and aweiteka > README

ADD el7-puppet.repo /etc/yum.repos.d/
ADD RPM-GPG-KEY-puppetlabs /etc/pki/rpm-gpg/

# TODO: do we need to add puppetlabs yum repos?
RUN yum install -y puppet
RUN yum install -y hostname

ADD run.sh /
ADD test.pp /

# start this server
#ENTRYPOINT /run.sh
#CMD /run.sh
ENV FACTER_fqdn=localhost
ENTRYPOINT ["puppet", "apply"]

# run ENTRYPOINT as this user...
USER root

LABEL INSTALL="docker run --rm -it --privileged -v /etc:/etc -v /var:/var -v /run:/run --net=host IMAGE"
