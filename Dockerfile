FROM zanda/jdk1.8:1.8
WORKDIR /data
RUN wget -q -P /data https://itrigger-daily.oss-cn-beijing.aliyuncs.com/k8s/skywalking-agent.tar.gz \
    && tar xf /data/skywalking-agent.tar.gz \
    && rm -f /data/skywalking-agent.tar.gz \
    && chown -R root:root /data/skywalking-agent
