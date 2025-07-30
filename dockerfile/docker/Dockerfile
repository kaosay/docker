
FROM ubuntu:latest

ENV USER=root
ENV PASSWD=tom123

COPY ./.init.sh /tmp
COPY ./tips.sh /jingsuai/tips.sh
COPY ./sources.list /etc/apt/sources.list

RUN chmod +x /tmp/.init.sh && \
	chmod +x /jingsuai/tips.sh && \
	apt update && \
	apt-get install -y openssh-server && \
	mkdir /var/run/sshd && \
	sed -i 's/#PermitRootLogin prohibit-password/PermitRootLogin yes/' /etc/ssh/sshd_config && \
	sed -i 's/#PasswordAuthentication yes/PasswordAuthentication yes/' /etc/ssh/sshd_config && \
	sed -i 's/#ClientAliveInterval 0/ClientAliveInterval 60/' /etc/ssh/sshd_config && \
	sed -i 's/#ClientAliveCountMax 3/ClientAliveCountMax 15/' /etc/ssh/sshd_config && \
	sed -i '$a /jingsuai/tips.sh' /etc/profile

EXPOSE 22

CMD /tmp/.init.sh && \
	/usr/sbin/sshd -D
