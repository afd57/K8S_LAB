FROM ubuntu:16.04

# WORKDIR /usr/src/app

# COPY req.txt ./
# COPY mongo.deb ./
# RUN pip install --no-cache-dir -r req.txt

# COPY /rest_api .
RUN apt update
RUN apt install -y build-essential zlib1g-dev libncurses5-dev libgdbm-dev libnss3-dev libssl-dev libreadline-dev libffi-dev wget libcurl3
RUN cd /tmp
RUN wget https://www.python.org/ftp/python/3.8.0/Python-3.8.0.tgz
RUN tar -xf Python-3.8.0.tgz
RUN cd Python-3.8.0;./configure --enable-optimizations
RUN cd Python-3.8.0; make -j 1
RUN cd Python-3.8.0; make altinstall
RUN python3.8 --version
COPY mongodb-linux-x86_64-ubuntu1604-4.2.3.tgz ./
COPY redis-5.0.7.tar.gz ./
RUN tar xzf redis-5.0.7.tar.gz
RUN cd redis-5.0.7; make
RUN tar xzvf mongodb-linux-x86_64-ubuntu1604-4.2.3.tgz
RUN mkdir -p /data/db
COPY init_server.sh ./

RUN python3.8 -m pip install --upgrade pip setuptools wheel
RUN pip install pymongo

COPY create_data.py ./

CMD [ "bash", "init_server.sh"]

