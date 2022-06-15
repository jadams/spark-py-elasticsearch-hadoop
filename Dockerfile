FROM gcr.io/spark-operator/spark-py:v3.1.1

RUN curl -sL "https://artifacts.elastic.co/downloads/elasticsearch-hadoop/elasticsearch-hadoop-${ESHADOOP_VERSION}.zip" -o /tmp/elasticsearch-hadoop-${ESHADOOP_VERSION}.zip \
 && unzip -q /tmp/elasticsearch-hadoop-${ESHADOOP_VERSION}.zip -d /tmp \
 && cp /tmp/elasticsearch-hadoop-${ESHADOOP_VERSION}/dist/elasticsearch-hadoop-${ESHADOOP_VERSION}.jar ${SPARK_HOME}/python/pyspark/jars \
 && rm -rf /tmp/elasticsearch-hadoop-${ESHADOOP_VERSION}.zip /tmp/elasticsearch-hadoop-${ESHADOOP_VERSION}
