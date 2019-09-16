# common/tdoer-service-registry

- Tag: harbor.toder.com/common/tdoer-service-registry:1.0.0
- Base Image: harbor.toder.com/library/alpine-openjdk8-jre-java:1.0.2

## Build

Example version: 1.0.0

```
docker build -t harbor.toder.com/common/tdoer-service-registry:1.0.0 .
```

## Build and Push

 Usage: 
 
 ```
 ./build.sh <TARGET_JAR> <VERSION>
 ```
 
 Example:
  
 ```
 ./build.sh ../../target-examples/tdoer-service-registry-1.0.1-RELEASE.jar 1.0.0
 ```

## Run    

Single Eureka Instance:

```
docker run --name tdoer-service-registry -p 7020:7020 -p 7021:7021 -e JAVA_OPTIONS="-Dport=7020 -Dmgmt-port=7021 -Deureka.instance.hostname=localhost -Dspring.cloud.config.label=master -Deureka.client.register-with-eureka=false -Deureka.client.fetch-registry=false -Deureka.client.service-url.defaultZone=http://localhost:7020/eureka/ -Deureka.environment=Development -Deureka.datacenter=T-Doer" -d harbor.toder.com/common/tdoer-service-registry:1.0.0
```

In container, Eureka will run with the command:

```
java -Dport=7020 -Dmgmt-port=7021 -Deureka.instance.hostname=localhost -Dspring.cloud.config.label=master -Deureka.client.register-with-eureka=false -Deureka.client.fetch-registry=false -Deureka.client.service-url.defaultZone=http://localhost:7020/eureka/ -Deureka.environment=Development -Deureka.datacenter=T-Doer -javaagent:/opt/agent-bond/agent-bond.jar=jolokia{{host=0.0.0.0}},jmx_exporter{{9779:/opt/agent-bond/jmx_exporter_config.yml}} -XX:+UseParallelGC -XX:GCTimeRatio=4 -XX:AdaptiveSizePolicyWeight=90 -XX:MinHeapFreeRatio=20 -XX:MaxHeapFreeRatio=40 -XX:+ExitOnOutOfMemoryError -cp . -jar /deployments/tdoer-service-registry-1.0.1-RELEASE.jar
```
