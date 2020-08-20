FROM python:3.8.3-alpine

WORKDIR /usr/src/app

ENV PYTHONDONTWRITEBYTECODE 1
ENV PYTHONUNBUFFERED 1

COPY ./backend ./backend
COPY ./backend/requirements.txt ./backend/requirements.txt

RUN apk update \
    && apk add postgresql-dev gcc python3-dev musl-dev

RUN pip install --upgrade pip

RUN pip install -r backend/requirements.txt


FROM node:12.2.0

WORKDIR /usr/src/app

COPY ./frontend ./frontend
COPY ./frontend/package.json ./frontend/package.json
COPY ./frontend/package-lock.json ./frontend/package-lock.json

RUN npm install
RUN npm install -g @angular/cli