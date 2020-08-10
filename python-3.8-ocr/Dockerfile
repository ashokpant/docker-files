FROM python:3.8-buster

RUN apt-get clean && \
	apt-get update && \
	apt-get install -y \
		build-essential \
		make \
		curl \
		git \
		autoconf \
		automake \
		libtool \
		pkg-config

RUN apt-get -y install poppler-utils libpoppler-cpp-dev
RUN apt-get -y install nginx

RUN apt-get -y install default-jre  libreoffice libreoffice-java-common libreoffice-writer

RUN pip install --src /usr/local/src flask flask_cors flask_script gevent wget boto3
RUN pip install --src /usr/local/src opencv-python pytesseract
RUN pip install --src /usr/local/src numpy scipy spacy
RUN pip install --src /usr/local/src  pdf2image reportlab  openpyxl pdfquery pdftotext python-docx xlsxwriter datefinder PyPDF2 camelot-py[cv]==0.8.0

# Download libpostal source to /usr/local/libpostal
RUN cd /usr/local && \
	git clone https://github.com/openvenues/libpostal

# Create Libpostal data directory at /var/libpostal/data
RUN cd /var && \
	mkdir libpostal && \
	cd libpostal && \
	mkdir data

# Install Libpostal from source
RUN cd /usr/local/libpostal && \
	./bootstrap.sh && \
	./configure --datadir=/var/libpostal/data && \
	make -j4 && \
	make install && \
	ldconfig

# Install Libpostal python Bindings
RUN pip install postal

CMD ["/bin/bash"]


