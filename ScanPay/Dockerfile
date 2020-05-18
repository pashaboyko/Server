FROM python:3-alpine

WORKDIR /usr/src/app
COPY ./web-server/requirements.txt ./
RUN pip3 install --no-cache-dir -r requirements.txt 
COPY ./common ../common
COPY ./web-server .

ENTRYPOINT  [ "python","-m", "web"]
