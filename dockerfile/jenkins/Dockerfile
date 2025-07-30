FROM docker.1ms.run/jenkins/jenkins

USER root

RUN apt-get install -y tzdata && \
        ln -sf /usr/share/zoneinfo/Asia/Shanghai /etc/localtime && \
        echo "Asia/Shanghai" > /etc/timezone
