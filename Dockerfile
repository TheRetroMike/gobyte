FROM ubuntu:20.04
RUN apt-get update -y
RUN apt-get install wget build-essential -y
WORKDIR /opt/
RUN wget https://github.com/gobytecoin/gobyte/releases/download/v0.16.2.1/gobytecore-0.16.2-x86_64-linux-gnu.tar.gz
RUN tar zxvf gobytecore-0.16.2-x86_64-linux-gnu.tar.gz
RUN mv gobytecore-0.16.2/bin/gobyted /usr/bin
RUN mv gobytecore-0.16.2/bin/gobyte-cli /usr/bin
RUN rm gobytecore-0.16.2-x86_64-linux-gnu.tar.gz
RUN rm -R gobytecore-0.16.2
RUN wget https://raw.githubusercontent.com/TheRetroMike/rmt-nomp/master/scripts/blocknotify.c
RUN gcc blocknotify.c -o /usr/bin/blocknotify
CMD /usr/bin/gobyted -printtoconsole
