#!/bin/sh

[ ! -z $APM_AGENT ] && [ $APM_AGENT = "elastic" ] && export JAVA_OPTS="$JAVA_OPTS -javaagent:/agent/elastic-apm-agent.jar"
[ ! -z $APM_AGENT ] && [ $APM_AGENT = "skywalking" ] && export JAVA_OPTS="$JAVA_OPTS -javaagent:/agent/skywalking-agent.jar"

[ -z $SW_AGENT_NAME ] && export SW_AGENT_NAME="Shopizer"
[ -z $SW_AGENT_COLLECTOR_BACKEND_SERVICES ] && export SW_AGENT_COLLECTOR_BACKEND_SERVICES="collector.skywalking.cluster.local"

/usr/local/tomcat/bin/catalina.sh
