# Use official Python parent image
FROM python:latest

# Set the working dir
WORKDIR /app

# Copy current content to docker
# [WARNING: git folder also copying]
ADD . /app

# env variables
ENV DEBIAN_FRONTEND noninteractive

# install needed packages
RUN apt-get update
RUN apt-get install vim -y
RUN apt-get install zsh -y
RUN sh sudo_setup.py

# install python packages
RUN pip install -r requirements.txt

# transplant_rc
RUN python setup.py

# Setup container
CMD ["/bin/zsh"]
