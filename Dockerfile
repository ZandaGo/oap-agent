FROM zanda/jdk1.8:1.8
WORKDIR /data
RUN wget -q -P /data https://itrigger-daily.oss-cn-beijing.aliyuncs.com/k8s/skywalking-agent.tar.gz \
    && tar xf /data/skywalking-agent.tar.gz \
    && rm -f /data/skywalking-agent.tar.gz \
    && chown -R root:root /data/skywalking-agent
COPY fzhtjw.ttf /usr/local/java/jre/lib/fonts/
COPY requirements.txt /data
RUN yum install epel-release -y \
    && yum install https://centos7.iuscommunity.org/ius-release.rpm -y \
    && yum install python36u -y \
    && yum install python36u-devel -y \
    && python3 -m venv /usr/local/py3 \
    && source /usr/local/py3/bin/activate \
    && pip install --upgrade pip \
    && pip install -r /data/requirements.txt
