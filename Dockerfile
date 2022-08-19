ARG ESHADOOP_VERSION=7.17.0

FROM alpine:latest as download
ARG ESHADOOP_VERSION
RUN apk add --no-cache curl unzip
WORKDIR /downloads
RUN curl -fSsL "https://artifacts.elastic.co/downloads/elasticsearch-hadoop/elasticsearch-hadoop-${ESHADOOP_VERSION}.zip" -o /downloads/elasticsearch-hadoop-${ESHADOOP_VERSION}.zip \
 && unzip -q /downloads/elasticsearch-hadoop-${ESHADOOP_VERSION}.zip -d /downloads

FROM gcr.io/spark-operator/spark-py:v2.4.5
ARG ESHADOOP_VERSION
COPY --from=download /downloads/elasticsearch-hadoop-${ESHADOOP_VERSION}/dist/elasticsearch-hadoop-${ESHADOOP_VERSION}.jar ${SPARK_HOME}/jars/elasticsearch-hadoop-${ESHADOOP_VERSION}.jar
