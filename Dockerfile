FROM ubuntu:18.04

RUN apt-get update
RUN apt-get -y install curl
RUN apt-get -y install unzip

ENV INSTALL_PATH /usr/local
RUN apt-get update
RUN apt install -y software-properties-common

RUN add-apt-repository -y ppa:openjdk-r/ppa


RUN curl --insecure -OL https://binaries.sonarsource.com/Distribution/sonar-scanner-cli/sonar-scanner-cli-4.7.0.2747-linux.zip

RUN unzip sonar-scanner-cli-4.7.0.2747-linux.zip -d ${INSTALL_PATH}
RUN rm -f sonar-scanner-cli-4.7.0.2747-linux.zip

ENV PATH="${INSTALL_PATH}/sonar-scanner-4.7.0.2747-linux/bin:${PATH}"

COPY sonar-scanner /usr/local/sonar-scanner-4.7.0.2747-linux/bin/

# CMD ["sonar-scanner"]
RUN apt-get update
RUN apt-get install -y libgbm-dev
RUN apt-get install -y libxss1
RUN apt-get install -y libgtk-3-0

FROM ubuntu:18.04

### Install wget, curl, git, unzip, gnupg, locales
RUN apt-get update
RUN apt-get -y install curl
RUN apt-get -y install git
RUN apt-get -y install unzip
RUN apt-get -y install wget

RUN apt-get  clean
RUN rm -rf /var/lib/apt/lists/*
RUN rm -rf /tmp/*

RUN wget https://github.com/peter-murray/github-security-report-action/releases/download/v2/github-security-report-bundle-linux-x64.zip

RUN unzip github-security-report-bundle-linux-x64.zip
RUN unzip github-security-report-bundle.zip -d github-security-report
