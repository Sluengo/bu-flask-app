# The FROM command specifies where the "base" image should be created from. 
FROM python:3.8-alpine

# EXPOSE is the command that specifies what port the app should run on
EXPOSE 5000/tcp

# Copy requirements.txt first to leverage Docker cache. This is the file that contains the packages needed for our app to run
COPY ./requirements.txt /app/requirements.txt

# WORKDIR sets the working directory for the instructions that follow.
WORKDIR /app

# RUNS a Linux command. Used to install packages into container, create folders, etc
RUN pip3 install -r requirements.txt

COPY . /app

# CMD provides a command and arguments for an executing container. There can be only one CMD. This is what actually runs our flask app
CMD [ "python", "./app.py" ]