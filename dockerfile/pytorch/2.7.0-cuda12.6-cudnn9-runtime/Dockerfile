FROM pytorch/pytorch:2.7.0-cuda12.6-cudnn9-runtime

ENV USER=root

COPY ./.init.sh /tmp
COPY ./sources.list /etc/apt/sources.list

RUN chmod +x /tmp/.init.sh && \
	apt update && \
	apt-get install -y openssh-server tzdata && \
	mkdir /var/run/sshd && \
        ln -sf /usr/share/zoneinfo/Asia/Shanghai /etc/localtime && \
        echo "Asia/Shanghai" > /etc/timezone && \
	sed -i 's/#PermitRootLogin prohibit-password/PermitRootLogin yes/' /etc/ssh/sshd_config && \
	sed -i 's/#PasswordAuthentication yes/PasswordAuthentication yes/' /etc/ssh/sshd_config && \
	sed -i 's/#ClientAliveInterval 0/ClientAliveInterval 60/' /etc/ssh/sshd_config && \
	sed -i 's/#ClientAliveCountMax 3/ClientAliveCountMax 15/' /etc/ssh/sshd_config && \
	sed -i '$a if [ -f /exclude/scripts/tips.sh ]; then\n    . /exclude/scripts/tips.sh\nfi' /etc/profile 

EXPOSE 22

CMD /tmp/.init.sh && \
	/usr/sbin/sshd -D
