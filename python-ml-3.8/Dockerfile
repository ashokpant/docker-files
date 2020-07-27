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

RUN pip install --src /usr/local/src flask flask_cors flask_script gevent wget boto3
RUN pip install --src /usr/local/src opencv-python pytesseract
RUN pip install --src /usr/local/src numpy scipy spacy
RUN pip install --src /usr/local/src  pdf2image reportlab  openpyxl pdfquery pdftotext python-docx xlsxwriter datefinder PyPDF2 camelot-py[cv]==0.8.0

CMD ["/bin/bash"]


