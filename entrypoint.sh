#!/bin/sh

cd "$GITHUB_WORKSPACE"

export REVIEWDOG_GITHUB_API_TOKEN="${INPUT_GITHUB_TOKEN}"

eclint --version

TARGET_FOLDER=$(mktemp -d -t reviewdog-eclint-XXXXXXXXXX)

# Make eclint think that we are Jenkins to get Checksuite result
JENKINS_URL=1 BUILD_ID=1 CI_REPORTS=$TARGET_FOLDER \
  eclint check ${INPUT_ECLINT_FLAGS:-'.'} 2>/dev/null \
  || cat "$TARGET_FOLDER/*/checkstyle-result.xml" \
  | reviewdog -f=checkstyle -name "eclint" -reporter="${INPUT_REPORTER:-github-pr-check}" -level="${INPUT_LEVEL}"
