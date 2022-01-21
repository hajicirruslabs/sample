FROM alpine:3.15.0

COPY install.sh /

RUN /install.sh

# RUN apk add bash icu-libs krb5-libs libgcc libintl libssl1.1 libstdc++ zlib

# #RUN apk add libgdiplus --repository https://alpine.global.ssl.fastly.net/alpine/edge/testing/
# RUN wget https://download.visualstudio.microsoft.com/download/pr/bd94779d-c7c4-47fd-b80a-0088caa0afc6/40f115bbf4c068359e7a066fe0b03dbc/dotnet-sdk-6.0.101-linux-musl-x64.tar.gz -P /etc
# ENV DOTNET_FILE=/etc/dotnet-sdk-6.0.101-linux-musl-x64.tar.gz
# ENV DOTNET_ROOT=/etc/dotnet6
# RUN mkdir -p "$DOTNET_ROOT" && tar zxf "$DOTNET_FILE" -C "$DOTNET_ROOT"
# RUN rm $DOTNET_FILE


# RUN wget https://download.visualstudio.microsoft.com/download/pr/efedb4fc-acec-4d03-a502-3e1ecc51eb0a/f4ee529ee13dc95bcd9146ca07e9174e/dotnet-sdk-5.0.404-linux-musl-x64.tar.gz -P /etc
# ENV DOTNET_FILE=/etc/dotnet-sdk-5.0.404-linux-musl-x64.tar.gz
# ENV DOTNET_ROOT=/etc/dotnet5
# RUN mkdir -p "$DOTNET_ROOT" && tar zxf "$DOTNET_FILE" -C "$DOTNET_ROOT"
# RUN rm $DOTNET_FILE


# RUN wget https://download.visualstudio.microsoft.com/download/pr/1da779d5-0177-4a0c-a439-34f38e1d4761/56649104a169e490e09b5cfc6e4ba26e/dotnet-sdk-3.1.416-linux-musl-x64.tar.gz -P /etc
# ENV DOTNET_FILE=/etc/dotnet-sdk-3.1.416-linux-musl-x64.tar.gz
# ENV DOTNET_ROOT=/etc/dotnet3
# RUN mkdir -p "$DOTNET_ROOT" && tar zxf "$DOTNET_FILE" -C "$DOTNET_ROOT"
# RUN rm $DOTNET_FILE

# ENV PATH=$PATH:$DOTNET_ROOT


