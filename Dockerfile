FROM docker/compose:alpine-1.29.2

WORKDIR /tmp/docker-test

RUN apk --update add jq && \
    rm -rf /var/lib/apt/lists/* && \
    rm /var/cache/apk/*

COPY challenges/ challenges/
COPY challenges-params/ challenges-params/
COPY expected-results/ expected-results/
COPY scripts/ scripts/

RUN chmod a+x -R ./scripts/*.sh

WORKDIR /tmp/docker-test/scripts
ENTRYPOINT ["./entrypoint.sh"]
