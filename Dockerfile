FROM debian:buster-slim
RUN apt-get update && apt-get install -y curl gnupg gnupg1 gnupg2
RUN echo "deb https://packages.cloud.google.com/apt coral-edgetpu-stable main" | tee /etc/apt/sources.list.d/coral-edgetpu.list
RUN curl https://packages.cloud.google.com/apt/doc/apt-key.gpg | apt-key add -
RUN apt-get update && apt-get install -y git gcc g++ make apt-utils build-essential autoconf automake libtool python3 python3-pip libedgetpu1-std python3-pycoral libfreetype6-dev libjpeg-dev libsdl-dev libportmidi-dev libsdl-ttf2.0-dev libsdl-mixer1.2-dev libsdl-image1.2-dev
COPY ./requirements.txt ./
RUN pip3 install -r requirements.txt
RUN mkdir coral
WORKDIR /coral
RUN git clone https://github.com/google-coral/pycoral.git
WORKDIR /coral/pycoral
RUN bash examples/install_requirements.sh classify_image.py
CMD python3 examples/classify_image.py --model test_data/mobilenet_v2_1.0_224_inat_bird_quant_edgetpu.tflite --labels test_data/inat_bird_labels.txt --input test_data/parrot.jpg
