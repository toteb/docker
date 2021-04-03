FROM registry.access.redhat.com/ubi8/ubi-init
RUN yum install -y httpd; yum clean all; systemctl enable httpd; yum install -y wget;
RUN wget https://raw.githubusercontent.com/toteb/doc/main/index.html && cp index.html /var/www/html/index.html
RUN mkdir /etc/systemd/system/httpd.service.d/; echo -e '[Service]\nRestart=always' > /etc/systemd/system/httpd.service.d/httpd.conf;
EXPOSE 80

