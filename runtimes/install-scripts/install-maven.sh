function installMaven() {
    start=`date +%s`
    apt install -y maven
    mvn -version
    end=`date +%s`
    runtime=$((end-start))
    echo =========================================$runtime
    # ### Install Maven (3.5.4)
    # MAVEN_VERSION=3.5.4
    # MAVEN_VERSION_SHA=CE50B1C91364CB77EFE3776F756A6D92B76D9038B0A0782F7D53ACF1E997A14D
    # MAVEN_BASE_URL=https://apache.osuosl.org/maven/maven-3/${MAVEN_VERSION}/binaries
    # MAVEN_HOME /usr/share/maven
    # MAVEN_CONFIG ${WSS_USER_HOME}/.m2

    # mkdir -p /usr/share/maven /usr/share/maven/ref && \
    #     curl -fsSL -o /tmp/apache-maven.tar.gz ${MAVEN_BASE_URL}/apache-maven-${MAVEN_VERSION}-bin.tar.gz && \
    #     echo "${MAVEN_VERSION_SHA}  /tmp/apache-maven.tar.gz" | sha256sum -c - && \
    #     tar -xzf /tmp/apache-maven.tar.gz -C /usr/share/maven --strip-components=1 && \
    #     rm -f /tmp/apache-maven.tar.gz && \
    #     ln -s /usr/share/maven/bin/mvn /usr/bin/mvn && \
    #     mkdir -p -m 777 ${WSS_USER_HOME}/.m2/repository && \
    #     chown -R ${WSS_USER}:${WSS_GROUP} ${WSS_USER_HOME}/.m2 && \
    #     rm -rf /tmp/*
}