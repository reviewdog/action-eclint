#!/bin/sh

cd "$GITHUB_WORKSPACE"

export REVIEWDOG_GITHUB_API_TOKEN="${INPUT_GITHUB_TOKEN}"

eclint --version

# Make eclint think that we are Jenkins to get Checksuite result
env JENKINS_URL=1 BUILD_ID=1 CI_REPORTS=/tmp/reports \
  eclint check ${INPUT_ECLINT_FLAGS:-'.'} 2>/dev/null \
  || cat lint-reports/*/checkstyle-result.xml \
  | reviewdog -f=checkstyle -name "eclint" -reporter="${INPUT_REPORTER:-github-pr-check}" -level="${INPUT_LEVEL}"
