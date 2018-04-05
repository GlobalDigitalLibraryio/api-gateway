FROM kong:0.13.0-alpine

COPY gdl-run-kong.sh /gdl-run-kong.sh
COPY nginx.tmpl /nginx.tmpl

RUN chmod +x /gdl-run-kong.sh

RUN echo "http://dl-4.alpinelinux.org/alpine/edge/testing" >> /etc/apk/repositories

RUN apk --update add --no-cache jq aws-cli

# ref https://github.com/Mashape/docker-kong/pull/84/files
RUN mkdir -p /usr/local/kong/logs \
    && ln -sf /tmp/logpipe /usr/local/kong/logs/access.log \
    && ln -sf /tmp/logpipe /usr/local/kong/logs/admin_access.log \
    && ln -sf /tmp/logpipe /usr/local/kong/logs/serf.log \
    && ln -sf /tmp/logpipe /usr/local/kong/logs/error.log

CMD ./gdl-run-kong.sh
