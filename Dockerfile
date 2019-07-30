FROM nvidia/cuda:9.2-cudnn7-devel-ubuntu18.04
LABEL maintainer="Dzmitry Nichyparuk"
ENV TZ=Europe/Minsk
RUN ln -snf /usr/share/zoneinfo/$TZ /etc/localtime && echo $TZ > /etc/timezone
RUN apt-get update \
    && apt-get -y upgrade \
    && apt-get install -y \
    git \
    wget \
    unzip \
    libopencv-dev \
    python-pip

#RUN pip install 'matplotlib==2.2.2'
RUN pip install opencv-python \
    numpy \
    scikit-image \
    paho-mqtt \
    pyyaml \
    requests \
    urllib3 \
    pytz \
    pygtail

# Add requirements file 
ADD requirements.txt /app/
RUN pip install -r /app/requirements.txt
ADD ./src /app
CMD python /app/app.py