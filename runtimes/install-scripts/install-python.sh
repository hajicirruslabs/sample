function installPython() {
    ### Install Python
    start=`date +%s`
    echo '###################################################################################################'
    echo '#################################### Installing Python' ${1} ' ####################################'
    echo '###################################################################################################'
    apt-get update && \
        apt-get install -y python${1} build-essential && \
        apt-get clean && \
    	rm -rf /var/lib/apt/lists/* && \
    	rm -rf /tmp/*
    end=`date +%s`
    isntalltime=$((end-start))
    echo '############################### Completed Installing Python' ${1} ' ###############################'
    echo Time taken - ${isntalltime}ms
}