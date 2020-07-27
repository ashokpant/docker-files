FROM python:3.8.2-buster

RUN apt-get clean \
    && apt-get -y update

RUN apt-get -y update \
    && apt-get -y install build-essential libpoppler-cpp-dev pkg-config python-dev
	
RUN apt-get -y install nginx \
    && apt-get -y install python3-dev \
    && apt-get -y install build-essential

RUN apt-get -y install default-jre 

RUN apt-get -y install libreoffice libreoffice-java-common
RUN apt-get -y install libreoffice-writer

RUN apt-get -y install poppler-utils

RUN pip install -r requirements.txt --src /usr/local/src

CMD ["/bin/bash"]


