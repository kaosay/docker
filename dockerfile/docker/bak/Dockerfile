
FROM ubuntu:latest

ENV USER=ubuntu
ENV PASSWD=tom123

COPY ./init.sh /tmp/init.sh

RUN chmod +x /tmp/init.sh && apt-get update && apt-get install -y openssh-server && mkdir /var/run/sshd 

EXPOSE 22

#CMD ["/usr/sbin/sshd", "-D"]
##CMD ["/usr/sbin/sshd -D"]
##CMD ["/tmp/init.sh", "&&", "/usr/sbin/sshd", "-D", "&&", "echo 'this is end of CMD!'"]
CMD /tmp/init.sh && \
	/usr/sbin/sshd -D
