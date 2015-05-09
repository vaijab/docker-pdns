FROM fedora:21

RUN yum update -y -q; yum clean all
RUN yum install -y -q pdns pdns-backend-mysql; yum clean all

COPY run.sh /run.sh
COPY pdns.conf /etc/pdns/pdns.conf

CMD /run.sh
