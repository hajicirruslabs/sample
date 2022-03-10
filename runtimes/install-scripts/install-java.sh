function installJava() {
    start=`date +%s`
    add-apt-repository -y ppa:openjdk-r/ppa
    apt-get update
    apt-get install -y --no-install-recommends openjdk-${1}-jdk
    apt-get clean
    end=`date +%s`
    runtime=$((end-start))
    echo =========================================$runtime
}