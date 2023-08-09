# SnareTanner Image
FROM ubuntu:22.04
LABEL maintainer="Atharva Auti"

# Set environment variables to prevent interactive prompts
ENV DEBIAN_FRONTEND=noninteractive

# Nameserver (if you run into issues)
# RUN echo "nameserver 8.8.8.8" >> /etc/resolv.conf
# RUN cat /etc/resolv.conf
# RUN nslookup google.com

# Set DNS environment variable
ARG DNS_SERVER=8.8.8.8
ENV DNS_SERVER=$DNS_SERVER

# Update and upgrade packages, install tzdata
RUN sed -i 's/^# deb-src/deb-src/' /etc/apt/sources.list && \
    sed -i 's/^# deb/deb/' /etc/apt/sources.list && \
    cat /etc/apt/sources.list && \
    apt-get update && \
    apt-get upgrade -y && \
    apt-get install -y --no-install-recommends tzdata

# Installing  packages required
RUN apt-get install --no-install-recommends -y net-tools build-essential python3 python3-pip fakeroot devscripts locales git wget rsyslog sudo cron nano putty-tools python3-twisted

# Install Python 3.9
RUN apt-get update && apt-get install -y software-properties-common
RUN add-apt-repository ppa:deadsnakes/ppa -y
RUN apt-get update -y && apt-get install python3.9 -y

# Dependencies
RUN apt-get install -y redis-server
RUN apt-get install -y python3.9-distutils python3.9-dev

# Clone repositories and install packages
RUN git clone https://github.com/mushorg/phpox && \
    cd phpox && \
    python3.9 -m pip install -r requirements.txt && \
    cd ..

RUN git clone https://github.com/mushorg/tanner && \
    cd tanner && \
    python3.9 -m pip install setuptools aioredis aiodocker aiomysql pylibinjection && \
    python3.9 -m pip install --upgrade websockets nats-py && \
    python3.9 -m pip install -r requirements.txt && \
    python3.9 setup.py install && \
    cd ..

RUN git clone https://github.com/mushorg/snare && \
    cd snare && \
    python3.9 -m pip install -r requirements.txt && \
    python3.9 setup.py install && \
    cd ..

COPY run.sh /run.sh
RUN chmod +x /run.sh

CMD ["/run.sh"]
