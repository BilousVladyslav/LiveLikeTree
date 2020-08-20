FROM  nikolaik/python-nodejs:python3.6-nodejs10-alpine

WORKDIR /usr/src/app

ENV PYTHONDONTWRITEBYTECODE 1
ENV PYTHONUNBUFFERED 1

COPY . . 


RUN apk update \
    && apk add postgresql-dev gcc python3-dev musl-dev

RUN pip install --upgrade pip

RUN pip install -r backend/requirements.txt

RUN npm install
RUN npm install -g @angular/cli


