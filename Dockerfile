FROM centos:6.6

RUN yum install -y -q http://www.mirrorservice.org/sites/dl.fedoraproject.org/pub/epel/6/i386/epel-release-6-8.noarch.rpm
RUN yum update -y -q; yum clean all
RUN yum install -y -q pdns pdns-backend-mysql; yum clean all

COPY run.sh /run.sh
COPY pdns.conf /etc/pdns/pdns.conf

CMD /run.sh
