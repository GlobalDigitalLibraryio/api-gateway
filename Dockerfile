FROM kong:0.10.4

COPY gdl-run-kong.sh /gdl-run-kong.sh
COPY nginx.tmpl /nginx.tmpl

RUN chmod +x /gdl-run-kong.sh

RUN yum --assumeyes install python-pip jq && \
 pip install awscli

# ref https://github.com/Mashape/docker-kong/pull/84/files
RUN mkdir -p /usr/local/kong/logs \
    && ln -sf /tmp/logpipe /usr/local/kong/logs/access.log \
    && ln -sf /tmp/logpipe /usr/local/kong/logs/admin_access.log \
    && ln -sf /tmp/logpipe /usr/local/kong/logs/serf.log \
    && ln -sf /tmp/logpipe /usr/local/kong/logs/error.log

CMD ./gdl-run-kong.sh
