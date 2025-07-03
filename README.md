# docker-files
Docker base images

## python-3.8-ml [dockerhub](https://hub.docker.com/r/ashokpant/python-3.8-ml)

* flask flask_cors flask_script gevent wget boto3
* numpy scipy spacy
* opencv-python pytesseract
* pdf2image reportlab  openpyxl pdfquery pdftotext python-docx xlsxwriter datefinder PyPDF2 camelot-py[cv]==0.8.0

## python-3.8-ocr [dockerhub](https://hub.docker.com/r/ashokpant/python-3.8-ocr)

* flask flask_cors flask_script gevent wget boto3
* numpy scipy spacy
* opencv-python pytesseract
* pdf2image reportlab  openpyxl pdfquery pdftotext python-docx xlsxwriter datefinder PyPDF2 camelot-py[cv]==0.8.0
* pypostal [github](https://github.com/openvenues/pypostal)

## Build locally
```
cd python-3.8-ocr/
docker build -t python-3.8-ocr  .
```
## Push to dockerhub
```
docker tag local-image:tagname new-repo:tagname
docker push new-repo:tagname
```