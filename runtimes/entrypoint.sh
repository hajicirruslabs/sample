#!/bin/bash

set -euo pipefail

for row in $(echo "${RUNTIME_VERSIONS}" | jq -r '.[] | @base64'); do
    _jq() {
        echo ${row} | base64 --decode | jq -r ${1}
    }
   runtime="$(_jq '.Runtime')"
   version="$(_jq '.Version')"
   case ${runtime} in
        "Java" )
            source /install-scripts/install-java.sh
            installJava $version
        ;;
        "Maven" )
            source /install-scripts/install-java.sh
            installMaven
        ;;
        "Gradle" )
            source /install-scripts/install-java.sh
            installGradle $version
        ;;
        ".NET" )
            source /install-scripts/install-dotnet.sh
            installDotNet $version
        ;;
        "NuGet" )
            source /install-scripts/install-dotnet.sh
            installNuGet $version
        ;;
        "Mono" )
            source /install-scripts/install-dotnet.sh
            installMono
        ;;
        "NodeJS" )
            source /install-scripts/install-node.sh
            installNodeJS $version
        ;;
        "TypeScript" )
            source /install-scripts/install-node.sh
            installTypescript
        ;;
        "Yarn" )
            source /install-scripts/install-node.sh
            installYarn
        ;;
        "Python" )
            source /install-scripts/install-python.sh
            installPython $version
        ;;
        * )
            echo "Invalid Runtime - $runtime"
        ;;
    esac
done