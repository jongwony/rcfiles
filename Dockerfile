# Use official Python parent image
FROM python:latest

# Set the working dir
WORKDIR /app

# Copy current content to docker
ADD . /app

# env variables
ENV DEBIAN_FRONTEND noninteractive

# install needed packages
RUN sh sudo_setup.sh
RUN pip install ipython[all]

# Setup container
CMD ["python", "setup.py"]
