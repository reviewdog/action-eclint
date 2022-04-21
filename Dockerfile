FROM node:current-alpine

ENV REVIEWDOG_VERSION=v0.14.1

RUN apk --no-cache add git

SHELL ["/bin/ash", "-eo", "pipefail", "-c"]
RUN wget -O - -q https://raw.githubusercontent.com/reviewdog/reviewdog/master/install.sh| sh -s -- -b /usr/local/bin/ ${REVIEWDOG_VERSION}

RUN npm install -g eclint

COPY entrypoint.sh /entrypoint.sh

ENTRYPOINT ["/entrypoint.sh"]
