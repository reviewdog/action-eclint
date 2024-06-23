FROM node:current-alpine

ENV REVIEWDOG_VERSION=v0.18.1

RUN echo "::warning::reviewdog/action-eclint is no longer maintained. Please use another action. See https://github.com/reviewdog/action-eclint/issues/29"

RUN apk --no-cache add git

SHELL ["/bin/ash", "-eo", "pipefail", "-c"]
RUN wget -O - -q https://raw.githubusercontent.com/reviewdog/reviewdog/master/install.sh| sh -s -- -b /usr/local/bin/ ${REVIEWDOG_VERSION}

RUN npm install -g eclint

COPY entrypoint.sh /entrypoint.sh

ENTRYPOINT ["/entrypoint.sh"]
