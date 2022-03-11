function installJava() {
    echo '###################################################################################################'
    echo '##################################### Installing Java' ${1} ' #####################################'
    echo '###################################################################################################'
    start=`date +%s`
    add-apt-repository -y ppa:openjdk-r/ppa
    apt-get update
    apt-get install -y --no-install-recommends openjdk-${1}-jdk
    apt-get clean
    end=`date +%s`
    isntalltime=$((end-start))
    echo '################################ Completed Installing Java' ${1} ' ################################'
    echo Time taken - ${isntalltime}ms
}

function installMaven() {
    echo '###################################################################################################'
    echo '######################################## Installing Maven  ########################################'
    echo '###################################################################################################'
    start=`date +%s`
    apt install -y maven
    apt-get clean
    mvn -version
    end=`date +%s`
    isntalltime=$((end-start))
    echo '################################ Completed Installing Maven ######################################'
    echo Time taken - ${isntalltime}ms
}

function installGradle() {
    ### Install Gradle
    echo '###################################################################################################'
    echo '######################################## Installing Gradle ########################################'
    echo '###################################################################################################'
    start=`date +%s`
    wget -q https://services.gradle.org/distributions/gradle-${1}-bin.zip && \
        unzip gradle-${1}-bin.zip -d /opt && \
        rm gradle-${1}-bin.zip

    ### Set Gradle in the environment variables
    export GRADLE_HOME=/opt/gradle-${1}
    export PATH=$PATH:/opt/gradle-${1}/bin
    end=`date +%s`
    isntalltime=$((end-start))
    echo '################################ Completed Installing Gradle #####################################'
    echo Time taken - ${isntalltime}ms
}