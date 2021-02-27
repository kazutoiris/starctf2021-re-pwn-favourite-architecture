FROM ubuntu:20.04

ENV DEBIAN_FRONTEND=noninteractive

RUN apt-get update && apt-get -y upgrade && \
    apt-get install -y lib32z1 xinetd psmisc && \
    apt-get install -y qemu-system && \
    useradd -u 8888 -m pwn

WORKDIR /home/pwn

COPY flag2 ./flag2
RUN chmod 400 ./flag2
COPY readflag2 ./readflag2
RUN chmod 4755 ./readflag2

EXPOSE 8888

CMD ["/usr/sbin/xinetd", "-dontfork"]

