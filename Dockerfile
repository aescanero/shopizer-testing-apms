FROM alpine:edge as builder

RUN apk update && apk add curl && mkdir /agent && cd /agent \
  && curl -sL https://downloads.apache.org/skywalking/8.0.1/apache-skywalking-apm-es7-8.0.1.tar.gz|tar -xz
  
FROM shopizerecomm/shopizer:latest

RUN mkdir /agent && curl -sL https://search.maven.org/remotecontent?filepath=co/elastic/apm/elastic-apm-agent/1.17.0/elastic-apm-agent-1.17.0.jar -o /agent/elastic-apm-agent.jar
COPY --from=builder /agent/apache-skywalking-apm-bin-es7/agent/ /agent/

ADD entrypoint.sh /usr/local/bin
RUN chmod 555 /usr/local/bin/entrypoint.sh
ENTRYPOINT ["/usr/local/bin/entrypoint.sh"]
