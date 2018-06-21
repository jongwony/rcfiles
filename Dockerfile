# Use official Python parent image
FROM python:latest

# Set the working dir
WORKDIR /app

# Copy current content to docker
ADD . /app

# env variables
ENV DEBIAN_FRONTEND noninteractive

# install needed packages
RUN apt-get update -y
RUN apt-get install vim -y
RUN apt-get install zsh -y
RUN pip install ipython[all]
RUN python setup.py

# Setup container
CMD ["/bin/zsh"]
