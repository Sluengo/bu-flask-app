FROM python:3.8-alpine
EXPOSE 5000/tcp
# Copy requirements.txt first to leverage Docker cache
COPY ./requirements.txt /app/requirements.txt
WORKDIR /app
RUN pip3 install -r requirements.txt
COPY . /app
CMD [ "python", "./app.py" ]