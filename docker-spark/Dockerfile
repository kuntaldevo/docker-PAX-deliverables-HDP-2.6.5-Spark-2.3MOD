FROM dtr.paxatadev.com/hortonworks/base:2.6.5-kerberos-8-hdp

# Related variables
ARG SPARK_DOWNLOAD_URL=https://s3.amazonaws.com/public-repo-1.hortonworks.com/HDP/centos7/2.x/updates/2.6.5.1001/tars/spark2/spark-2.3.0.2.6.5.1001-8-bin-2.7.3.2.6.5.1001-8.tgz
ENV SPARK_HOME=/usr/local/spark
ENV SPARK_CONF_DIR=${SPARK_HOME}/conf
ENV PATH=$PATH:/usr/local/spark/bin:/usr/local/spark/sbin

# Install Spark
RUN SPARK_ARCHIVE_NAME="${SPARK_DOWNLOAD_URL##*/}" && \
    wget ${SPARK_DOWNLOAD_URL} && \
    mkdir ${SPARK_HOME} && \
    tar -xzf ${SPARK_ARCHIVE_NAME} -C ${SPARK_HOME} --strip-components 1 && \
    rm ${SPARK_ARCHIVE_NAME}

# Add configuration files
COPY files/start-spark /usr/sbin/

# Change permission
RUN chmod 755 /usr/sbin/start-spark

# Expose ports
# SparkContext web UI on 4040
# Spark master web UI on 8080
# Spark worker web UI on 8081
EXPOSE 4040 8080 8081

# Start bash
CMD ["start-spark"]
