function installDotNet() {
    start=`date +%s`
    #### Install dotnet SDK
    wget -q https://packages.microsoft.com/config/ubuntu/18.04/packages-microsoft-prod.deb -O packages-microsoft-prod.deb && \
    dpkg -i packages-microsoft-prod.deb && \
    apt-get update && \
    apt-get install -y apt-transport-https && \
    apt-get install -y --no-install-recommends dotnet-sdk-${1} && \
    rm packages-microsoft-prod.deb && \
    apt-get clean && \
    rm -rf /var/lib/apt/lists/* && \
    rm -rf /tmp/*
    apt-get clean
    end=`date +%s`
    runtime=$((end-start))
    echo =========================================$runtime
}