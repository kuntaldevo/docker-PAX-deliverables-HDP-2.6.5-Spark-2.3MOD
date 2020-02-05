FROM dtr.paxatadev.com/paxata/paxata-base:8-hdp

# Related variables
ARG HADOOP_DOWNLOAD_URL=http://public-repo-1.hortonworks.com/HDP/centos7/2.x/updates/2.6.5.0/HDP-2.6.5.0-centos7-rpm.tar.gz

ENV HDP_VERSION=2.6.5
ENV HADOOP_HOME=/usr/local/hadoop
ENV HADOOP_CONF_DIR=/etc/hadoop/conf
ENV PATH=$PATH:${HADOOP_HOME}/bin:${HADOOP_HOME}/sbin

# Install Hadoop
RUN HADOOP_ARCHIVE_NAME="${HADOOP_DOWNLOAD_URL##*/}" && \
    wget ${HADOOP_DOWNLOAD_URL} && \
    mkdir -p ${HADOOP_HOME} /etc/hadoop && \
    tar -xzf ${HADOOP_ARCHIVE_NAME} -C ${HADOOP_HOME} --strip-components 1 && \
    rm ${HADOOP_ARCHIVE_NAME}

RUN ln -s ${HADOOP_HOME}/etc/hadoop ${HADOOP_CONF_DIR}

COPY files/hadoop-conf ${HADOOP_CONF_DIR}

# Create users
RUN groupadd hadoop && \
    useradd -ms /bin/bash -Ng hadoop hdfs && \
    useradd -ms /bin/bash -Ng hadoop yarn && \
    useradd -ms /bin/bash -Ng hadoop mapred && \
    useradd -ms /bin/bash -Ng hadoop spark && \
    useradd -ms /bin/bash -Ng hadoop hive && \
    useradd -ms /bin/bash -Ng hadoop paxata

RUN chown -R root:root ${HADOOP_HOME}
