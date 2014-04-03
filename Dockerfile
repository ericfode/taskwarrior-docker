FROM ubuntu
RUN apt-get -y update 
RUN apt-get -y install build-essential g++ gnutls-bin libgnutls-dev curl cmake uuid-dev
RUN curl -O http://taskwarrior.org/download/taskd-1.0.0.tar.gz
RUN tar xzf taskd-1.0.0.tar.gz
WORKDIR taskd-1.0.0
RUN cmake .
RUN make
RUN make install

WORKDIR /

RUN curl -O http://taskwarrior.org/download/task-2.3.0.tar.gz
RUN tar xzf task-2.3.0.tar.gz
RUN cd task-2.3.0
WORKDIR /task-2.3.0
RUN cmake .
RUN make
RUN make install

RUN mkdir /task_data
RUN mkdir /task_keys
ENV TASKDATA /task_data
ENV KEYS /task_keys

ADD ./init.sh /init.sh
ADD ./init_keys.sh /init_keys.sh

WORKDIR /

CMD taskd server --data /task_data

VOLUME ["/task_data" "/task_keys"]
