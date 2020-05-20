# image_name: Tag_name
FROM python:3.7-alpine

MAINTAINER ARIEL GAD

ENV PYTHONUNBUFFERED 1

COPY ./requirements.txt /requirements.txt

RUN pip install -r /requirements.txt


# Create a directory within the image
RUN mkdir /app

# configure a default directory location
WORKDIR /app

COPY ./app /app

# create a user for this application only - otherwise, the application will run on a root user
RUN adduser -D user
USER user