function installNodeJS() {
    ### Install Node.js (12.19.0) + NPM (6.14.8)
    apt-get update && \
    	curl -sL https://deb.nodesource.com/setup_${1} | bash && \
        apt-get install -y nodejs build-essential && \
        apt-get clean && \
    	rm -rf /var/lib/apt/lists/* && \
    	rm -rf /tmp/*
}