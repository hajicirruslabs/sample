#!/bin/bash

export GITHUB_TOKEN=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

git clone https://x-access-token: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@github.com/cirruslabs-io/codeql-sample.git

${CODEQL_HOME}/codeql database create ./codeql_db --source-root ./codeql-sample

${CODEQL_HOME}/codeql database analyze ./codeql_db --format=sarif-latest  --output=./codeql_result.json ./codeql-sample/.codeql.qls

cat ./codeql_result.json