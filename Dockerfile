FROM ubuntu:latest

RUN apt-get update && apt-get install curl -y
RUN curl -LO https://storage.googleapis.com/container-structure-test/v1.11.0/container-structure-test-linux-amd64 && \
  chmod +x container-structure-test-linux-amd64 && \
  mv container-structure-test-linux-amd64 /usr/local/bin/container-structure-test

COPY entrypoint.sh /entrypoint.sh

ENTRYPOINT [ "/entrypoint.sh" ]
