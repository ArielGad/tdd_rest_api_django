# image_name: Tag_name
FROM python:3.7-alpine

MAINTAINER ARIEL GAD

ENV PYTHONUNBUFFERED 1

COPY ./requirements.txt /requirements.txt

RUN apk add --update --no-cache postgresql-client
RUN apk add --update --no-cache --virtual .tmp-build-deps \
      gcc libc-dev linux-headers postgresql-dev

RUN pip install -r /requirements.txt
RUN apk del .tmp-build-deps


# Create a directory within the image
RUN mkdir /app

# configure a default directory location
WORKDIR /app

COPY ./app /app

# create a user for this application only - otherwise, the application will run on a root user
RUN adduser -D user
USER user