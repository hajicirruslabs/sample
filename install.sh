echo -n "--------------------Install DotNet--------------------------"
echo ""

echo "Installing DotNet6...."
wget https://download.visualstudio.microsoft.com/download/pr/bd94779d-c7c4-47fd-b80a-0088caa0afc6/40f115bbf4c068359e7a066fe0b03dbc/dotnet-sdk-6.0.101-linux-musl-x64.tar.gz -P /etc
export DOTNET_FILE=/etc/dotnet-sdk-6.0.101-linux-musl-x64.tar.gz
export DOTNET_ROOT=/etc/dotnet6
mkdir -p "$DOTNET_ROOT" && tar zxf "$DOTNET_FILE" -C "$DOTNET_ROOT"
rm $DOTNET_FILE
export PATH=$PATH:$DOTNET_ROOT


echo ""
echo -n "--------------------Install Java--------------------------"
echo ""

echo "Installing Java11...."
apk add openjdk11


echo ""
echo -n "--------------------Install Python--------------------------"
echo ""

echo "Installing Python3...."
apk add --no-cache python3 py3-pip


echo ""
echo -n "--------------------Install NodeJS--------------------------"
echo ""
echo "Installing NodeJS 12...."
apk add --no-cache --repository http://dl-cdn.alpinelinux.org/alpine/v3.11/main/ nodejs=12.22.6-r0

echo ""
echo -n "--------------------Completed!--------------------------"

