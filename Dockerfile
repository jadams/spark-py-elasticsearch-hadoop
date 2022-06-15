FROM gcr.io/spark-operator/spark-py:v2.4.5
ARG ESHADOOP_VERSION=7.17.0
COPY elasticsearch-hadoop-${ESHADOOP_VERSION}.jar  ${SPARK_HOME}/python/pyspark/jars/elasticsearch-hadoop-${ESHADOOP_VERSION}.jar
