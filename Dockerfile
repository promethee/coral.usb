FROM debian:buster-slim
RUN apt-get update
RUN apt-get install -y git gcc g++ make apt-utils build-essential autoconf automake libtool python3 python3-pip
COPY ./requirements.txt ./
RUN pip3 install -r requirements.txt
WORKDIR /usr/src/app
COPY ./CODE2000.TTF ./main.py ./
CMD python3 main.py
