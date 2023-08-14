FROM ubuntu:latest

RUN apt-get update
RUN apt-get upgrade -y
RUN apt-get install -y rtl-sdr librtlsdr-dev wget

RUN wget https://airspy.com/?ddownload=5795 -O spyserver-linux-arm64.tgz;\
    tar xvzf spyserver-linux-arm64.tgz;\
    rm spyserver-linux-arm64.tgz;
 
RUN mv spyserver spyserver_ping /usr/bin && \
    mkdir -p /etc/spyserver && \
    mv spyserver.config /etc/spyserver

COPY entrypoint.sh .
ENTRYPOINT ["./entrypoint.sh"]
