FROM python:3.12-slim
LABEL maintainer = "ashok@treeleaf.ai"
LABEL version="1.0.0"
LABEL vendor="Ashok"

RUN apt-get update && apt-get install -y curl vim git && apt-get clean
WORKDIR /base
COPY requirements.txt /base/
RUN pip install --no-cache-dir -r requirements.txt
EXPOSE 8000
ENV PYTHONUNBUFFERED=1
CMD ["python3"]
