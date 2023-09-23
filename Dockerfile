FROM ubuntu:latest

RUN apt-get update
RUN apt-get -y upgrade
RUN apt-get install -y rtl-sdr librtlsdr-dev wget

RUN set -ex; \
  if [ $(arch) = "armv7l" ]; then \
    echo "v7";\
    wget https://airspy.com/?ddownload=4247 -O spyserver-arm32.tgz;\
    tar xvzf spyserver-arm32.tgz;\
    rm spyserver-arm32.tgz;\
  elif [ $(arch) = "aarch64" ]; then \
    echo "arm64";\
    wget https://airspy.com/?ddownload=5795 -O spyserver-linux-arm64.tgz;\
    tar xvzf spyserver-arm64.tgz;\
    rm spyserver-arm64.tgz;\
  else echo "neither armv7 nor aarch64 found";\
  fi;

#RUN wget https://airspy.com/?ddownload=5795 -O spyserver-linux-arm64.tgz;\
#    tar xvzf spyserver-linux-arm64.tgz;\
#    rm spyserver-linux-arm64.tgz;

RUN mv spyserver spyserver_ping /usr/bin && \
    mkdir -p /etc/spyserver && \
    mv spyserver.config /etc/spyserver

COPY entrypoint.sh .
ENTRYPOINT ["./entrypoint.sh"]