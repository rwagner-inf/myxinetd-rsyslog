FROM robertomendonca/myxinet-rsyslog

RUN yum install nc -y


RUN rm -rf /etc/xinetd.d/*
COPY atf-stream /etc/xinetd.d/atf-stream 
COPY myscript.sh /opt/myscript.sh

COPY entry.sh /entry.sh
RUN chmod +x /entry.sh
RUN chmod +x /opt/myscript.sh

EXPOSE 50506

ENTRYPOINT [ "/entry.sh" ]
