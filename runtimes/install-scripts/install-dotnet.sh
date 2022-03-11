function installDotNet() {
    start=`date +%s`
    #### Install dotnet SDK
    echo '###################################################################################################'
    echo '##################################### Installing .NET' ${1} ' #####################################'
    echo '###################################################################################################'
    wget -q https://packages.microsoft.com/config/ubuntu/18.04/packages-microsoft-prod.deb -O packages-microsoft-prod.deb && \
        dpkg -i packages-microsoft-prod.deb && \
        apt-get update && \
        apt-get install -y apt-transport-https && \
        apt-get install -y --no-install-recommends dotnet-sdk-${1} && \
        rm packages-microsoft-prod.deb && \
        apt-get clean && \
        rm -rf /var/lib/apt/lists/* && \
        rm -rf /tmp/* && \
        apt-get clean
    end=`date +%s`
    isntalltime=$((end-start))
    echo '################################ Completed Installing .NET' ${1} ' ################################'
    echo Time taken - ${isntalltime}ms
}


function installNuGet() {
    start=`date +%s`
    #### Install NuGet
    echo '###################################################################################################'
    echo '##################################### Installing NuGet' ${1} ' ####################################'
    echo '###################################################################################################'
    TMP=/tmp/nuget  && \
        LIB=/usr/local/lib && \
        BIN=/usr/local/bin && \
        rm -rf $TMP $LIB/nuget $BIN/nuget && \
        mkdir -p $TMP && \
        cd $TMP && \
        wget -O nuget.zip https://www.nuget.org/api/v2/package/NuGet.CommandLine/${1} && \
        unzip nuget.zip && \
        install -d $LIB/nuget  && \
        install ./tools/NuGet.exe $LIB/nuget/ && \
        echo '#!/usr/bin/env bash\nexec mono /usr/local/lib/nuget/NuGet.exe "$@"\n' > $BIN/nuget && \
        chmod a+x $BIN/nuget && \
        rm -rf $TMP
    end=`date +%s`
    isntalltime=$((end-start))
    echo '################################ Completed Installing NuGet' ${1} ' ################################'
    echo Time taken - ${isntalltime}ms
}

function installMono() {
    start=`date +%s`
    #### Install Mono
    echo '###################################################################################################'
    echo '##################################### Installing Mono #####################################'
    echo '###################################################################################################'
    apt-get update && \
        apt-key adv --keyserver hkp://keyserver.ubuntu.com:80 --recv-keys 3FA7E0328081BFF6A14DA29AA6A19B38D3D831EF && \
        apt-get install -y --no-install-recommends apt-transport-https ca-certificates && \
        echo "deb https://download.mono-project.com/repo/ubuntu bionic main" | tee /etc/apt/sources.list.d/mono-official-stable.list && \
        apt-get update && \
        apt-get install -y mono-devel && \
        apt-get clean && \
        rm -rf /var/lib/apt/lists/* && \
        rm -rf /tmp/*
    end=`date +%s`
    isntalltime=$((end-start))
    echo '################################ Completed Installing Mono #################################'
    echo Time taken - ${isntalltime}ms
}