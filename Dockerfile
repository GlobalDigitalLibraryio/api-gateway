FROM kong:0.10.4

COPY gdl-run-kong.sh /gdl-run-kong.sh
RUN chmod +x /gdl-run-kong.sh

RUN yum --assumeyes install python-pip jq && \
 pip install awscli

CMD ./gdl-run-kong.sh
