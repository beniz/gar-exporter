FROM python:3.6-alpine

RUN apk update
RUN apk --no-cache add openssl-dev gcc libffi-dev linux-headers musl-dev
RUN pip install setuptools prometheus_client google-api-python-client cryptography cffi pyOpenSSL oauth2client

ENV BIND_PORT 9172
ENV START_DATE "2018-01-01"
ENV ACCOUNT_EMAIL "blabla@dd.com"
ENV VIEW_ID "132110965"

ADD . /usr/src/app
WORKDIR /usr/src/app

CMD ["python", "gar_exporter.py"]
