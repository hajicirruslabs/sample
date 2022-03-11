function installNodeJS() {
    ### Install Node.js
    start=`date +%s`
    echo '###################################################################################################'
    echo '#################################### Installing NodeJS' ${1} ' ####################################'
    echo '###################################################################################################'
    apt-get update && \
    	curl -sL https://deb.nodesource.com/setup_${1} | bash && \
        apt-get install -y nodejs build-essential && \
        apt-get clean && \
    	rm -rf /var/lib/apt/lists/* && \
    	rm -rf /tmp/*
    end=`date +%s`
    isntalltime=$((end-start))
    echo '############################### Completed Installing NodeJS' ${1} ' ###############################'
    echo Time taken - ${isntalltime}ms
}

function installTypescript() {
    ### Install Typescript
    npm i -g typescript
}

function installYarn() {
    ### Install Yarn
    npm i -g yarn
}