FROM ubuntu:18.04

RUN apt-get update
RUN apt-get -y install curl
RUN apt-get -y install unzip

ENV INSTALL_PATH /usr/local


RUN curl --insecure -OL https://binaries.sonarsource.com/Distribution/sonar-scanner-cli/sonar-scanner-cli-4.7.0.2747-linux.zip

RUN unzip sonar-scanner-cli-4.7.0.2747-linux.zip -d ${INSTALL_PATH}
RUN rm -f sonar-scanner-cli-4.7.0.2747-linux.zip

ENV PATH="${INSTALL_PATH}/sonar-scanner-4.7.0.2747-linux/bin:${PATH}"

COPY sonar-scanner /usr/local/sonar-scanner-4.7.0.2747-linux/bin/

CMD ["sonar-scanner"]