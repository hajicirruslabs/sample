FROM ubuntu:18.04

### Install wget, curl, git, unzip, gnupg, locales
RUN apt-get update && \
	apt-get -y install \
      curl \
      git \
      gnupg \
      locales  \
      unzip \
      wget \
    && locale-gen en_US.UTF-8 && \
	apt-get clean && \
	rm -rf /var/lib/apt/lists/* && \
	rm -rf /tmp/*

### Install jq JSON parser
RUN apt update
RUN apt install jq -y

RUN apt install -y software-properties-common
RUN apt update

ENV RUNTIME_VERSIONS '[{"Runtime": "Mono", "Version": "5.10.0"}, {"Runtime": "Python", "Version": "3.7"}, {"Runtime": "Java", "Version": "11"}, {"Runtime": "Maven", "Version": "8"}, {"Runtime": ".NET", "Version": "5.0"}, {"Runtime": "NodeJS", "Version": "16.x"}]'

COPY install-scripts /install-scripts/
RUN chmod +x /install-scripts/*.sh

### entrypoint.sh
COPY entrypoint.sh /
RUN chmod +x /entrypoint.sh
ENTRYPOINT [ "/entrypoint.sh" ]