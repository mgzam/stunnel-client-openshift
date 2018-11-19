FROM centos

RUN yum install -y stunnel openssl sed telnet && yum clean all && \
    mkdir -p /etc/stunnel/config /etc/stunnel/pki

ADD config /etc/stunnel/config/config
ADD launch.sh /launch.sh

RUN chown -R 1001:0 /etc/stunnel /launch.sh && \
    chmod -R g+rw /etc/stunnel && \
    chmod ug+rwx /launch.sh

USER 1001
EXPOSE 5002

CMD /launch.sh
