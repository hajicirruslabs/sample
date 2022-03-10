#!/bin/bash

for row in $(echo "${RUNTIME_VERSIONS}" | jq -r '.[] | @base64'); do
    _jq() {
        echo ${row} | base64 --decode | jq -r ${1}
    }
   runtime="$(_jq '.Runtime')"
   version="$(_jq '.Version')"
   case ${runtime} in
        "Java" )
            source ./install-scripts/install-java.sh
            installJava $version
            # apt-get install -y openjdk-${version}-jdk
        ;;
        "Maven" )
            source ./install-scripts/install-maven.sh
            installMaven
        ;;
        ".NET" )
            source install-scripts/install-dotnet.sh
            installDotNet $version
        ;;
        "NodeJS" )
            source install-scripts/install-node.sh
            installNodeJS $version
        ;;
        "Python" )
            echo "Installing Java17...."
        ;;
        * )
            echo "Invalid Runtime - $runtime"
        ;;
    esac
done

# echo -n "--------------------Install DotNet--------------------------"
# echo ""

# while true; do
# read -p "Please enter DotNet version to install (3/5/6)? " version
# case ${version} in
#     6 )
#         echo "Installing DotNet6...."
#         wget https://download.visualstudio.microsoft.com/download/pr/bd94779d-c7c4-47fd-b80a-0088caa0afc6/40f115bbf4c068359e7a066fe0b03dbc/dotnet-sdk-6.0.101-linux-musl-x64.tar.gz -P /etc
# 	export DOTNET_FILE=/etc/dotnet-sdk-6.0.101-linux-musl-x64.tar.gz
# 	export DOTNET_ROOT=/etc/dotnet6
# 	mkdir -p "$DOTNET_ROOT" && tar zxf "$DOTNET_FILE" -C "$DOTNET_ROOT"
# 	rm $DOTNET_FILE
# 	break
#     ;;
#     5 )
#         echo "Installing DotNet5...."
# 	wget https://download.visualstudio.microsoft.com/download/pr/efedb4fc-acec-4d03-a502-3e1ecc51eb0a/f4ee529ee13dc95bcd9146ca07e9174e/dotnet-sdk-5.0.404-linux-musl-x64.tar.gz -P /etc
# 	export DOTNET_FILE=/etc/dotnet-sdk-5.0.404-linux-musl-x64.tar.gz
# 	export DOTNET_ROOT=/etc/dotnet5
# 	mkdir -p "$DOTNET_ROOT" && tar zxf "$DOTNET_FILE" -C "$DOTNET_ROOT"
# 	rm $DOTNET_FILE
# 	break
#     ;;
#     3 )
#         echo "Installing DotNet3...."
# 	wget https://download.visualstudio.microsoft.com/download/pr/1da779d5-0177-4a0c-a439-34f38e1d4761/56649104a169e490e09b5cfc6e4ba26e/dotnet-sdk-3.1.416-linux-musl-x64.tar.gz -P /etc
# 	export DOTNET_FILE=/etc/dotnet-sdk-3.1.416-linux-musl-x64.tar.gz
# 	export DOTNET_ROOT=/etc/dotnet3
# 	mkdir -p "$DOTNET_ROOT" && tar zxf "$DOTNET_FILE" -C "$DOTNET_ROOT"
# 	rm $DOTNET_FILE
# 	break
#     ;;
#     * )
#         echo "Please enter valid DotNet version (3/5/6)"
#     ;;
# esac
# done

# echo ""
# echo -n "--------------------Install Java--------------------------"
# echo ""

# while true; do
# read -p "Please enter Java version to install (8/11)? " version
# case ${version} in
#     8 )
#         echo "Installing Java8...."
#         apk add openjdk8
# 	break
#     ;;
#     11 )
#         echo "Installing Java11...."
#         apk add openjdk11
# 	break
#     ;;
#     * )
#         echo "Please enter valid Java version (8/11)"
#     ;;
# esac
# done

# echo ""
# echo -n "--------------------Install Python--------------------------"
# echo ""

# while true; do
# read -p "Please enter Python version to install (2/3)? " version
# case ${version} in
#     2 )
#         echo "Installing Python2...."
#         apk add --no-cache python2 py2-pip
# 	break
#     ;;
#     3 )
#         echo "Installing Python3...."
#         apk add --no-cache python3 py3-pip
# 	break
#     ;;
#     * )
#         echo "Please enter valid Python version (2/3)"
#     ;;
# esac
# done


# echo ""
# echo -n "--------------------Install NodeJS--------------------------"
# echo ""
# while true; do
# read -p "Please enter NodeJS version to install (10/12)? " version
# case ${version} in
#     10 )
#         echo "Installing NodeJS 10...."
#         apk add --no-cache --repository http://dl-cdn.alpinelinux.org/alpine/v3.9/main/ nodejs=10.19.0-r0
# 	break
#     ;;
#     12 )
#         echo "Installing NodeJS 12...."
#         apk add --no-cache --repository http://dl-cdn.alpinelinux.org/alpine/v3.11/main/ nodejs=12.22.6-r0
# 	break
#     ;;
#     * )
#         echo "Please enter valid NodeJS version (10/12)"
#     ;;
# esac
# done

# echo ""
# echo -n "--------------------Completed!--------------------------"