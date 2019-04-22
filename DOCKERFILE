FROM ubuntu:16.04

# change source to ustc and install basic dependencies
# `source.list` required
COPY ./sources.list /etc/apt/sources.list

# c++ dependencies
RUN apt update && \
apt-get install -y build-essential libboost-all-dev cmake

# install Anaconda Python 3.6
# `Anaconda3-5.2.0-Linux-x86_64.sh` required
ENV LANG=C.UTF-8 LC_ALL=C.UTF-8
ENV PATH /opt/conda/bin:$PATH

COPY ./Anaconda3-5.2.0-Linux-x86_64.sh /tmp/
RUN /bin/bash /tmp/Anaconda3-5.2.0-Linux-x86_64.sh -b -p /opt/conda && \
    rm /tmp/Anaconda3-5.2.0-Linux-x86_64.sh && \
    ln -s /opt/conda/etc/profile.d/conda.sh /etc/profile.d/conda.sh && \
    echo ". /opt/conda/etc/profile.d/conda.sh" >> ~/.bashrc

# install flask
RUN pip install -i https://mirrors.ustc.edu.cn/pypi/web/simple flask