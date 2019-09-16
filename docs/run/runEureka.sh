#!/usr/bin/env bash

BASE=`dirname "$0"`
CONF_DIR=./config/

JAVA_OPTS=""
JAVA_OPTS="$JAVA_OPTS -Dspring.cloud.config.label=master"
JAVA_OPTS="$JAVA_OPTS -Deureka.environment=Prod -Deureka.datacenter=T-Doer"
JAVA_OPTS="$JAVA_OPTS -Dport=7020 -Dmgmt-port=7021-Deureka.instance.hostname=peer1"
JAVA_OPTS="$JAVA_OPTS -Dlogging.config=http://localhost:7010/common-demo-provider/default/master/logback-spring.xml"
JAVA_OPTS="$JAVA_OPTS -Deureka.client.service-url.defaultZone=http://peer2:7026/eureka/"

echo $JAVA_OPTS

java -cp $CONF_DIR:./* $JAVA_OPTS -jar common-spring-eureka-1.0.0-RELEASE.jar
