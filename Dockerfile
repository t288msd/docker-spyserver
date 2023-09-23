FROM ubuntu:latest

ARG TARGETPLATFORM
ENV TARGETPLATFORM "$TARGETPLATFORM"

RUN apt-get update
RUN apt-get -y upgrade
RUN apt-get install -y rtl-sdr librtlsdr-dev wget

RUN set -ex; \
  if [ "$TARGETPLATFORM" = "linux/amd64" ]; then \
    wget https://airspy.com/?ddownload=4262 -O spyserver-linux-x64.tgz;\
    tar xvzf spyserver-linux-x64.tgz;\
    rm spyserver-linux-x64.tgz;\
  elif [ "$TARGETPLATFORM" = "linux/arm/v7" ]; then \
    wget https://airspy.com/?ddownload=4247 -O spyserver-arm32.tgz;\
    tar xvzf spyserver-arm32.tgz;\
    rm spyserver-arm32.tgz;\
  elif [ "$TARGETPLATFORM" = "linux/arm/v8" ]; then \
    wget https://airspy.com/?ddownload=5795 -O spyserver-linux-arm64.tgz;\
    tar xvzf spyserver-arm64.tgz;\
    rm spyserver-arm64.tgz;\
  fi;

#RUN wget https://airspy.com/?ddownload=5795 -O spyserver-linux-arm64.tgz;\
#    tar xvzf spyserver-linux-arm64.tgz;\
#    rm spyserver-linux-arm64.tgz;
 
RUN mv spyserver spyserver_ping /usr/bin && \
    mkdir -p /etc/spyserver && \
    mv spyserver.config /etc/spyserver

COPY entrypoint.sh .
ENTRYPOINT ["./entrypoint.sh"]
