FROM gcr.io/spark-operator/spark-py:v2.4.5
USER root
ENV DEBIAN_FRONTEND noninteractive
RUN apt-get update --allow-releaseinfo-change \
    && apt-get install -y nfs-common \
    && apt-get clean \
    && rm -rf /var/lib/apt/lists/* /tmp/* /var/tmp/*
USER ${spark_uid}
ARG ESHADOOP_VERSION=7.17.0
COPY elasticsearch-hadoop-${ESHADOOP_VERSION}.jar ${SPARK_HOME}/jars/elasticsearch-hadoop-${ESHADOOP_VERSION}.jar
