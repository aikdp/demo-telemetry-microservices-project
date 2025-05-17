FROM python:3.14
# FROM python:3.14-rc-alpine

WORKDIR /usr/src/app

COPY requirements.txt .
RUN pip install --upgrade pip
RUN pip install -r requirements.txt
COPY . .
ENTRYPOINT [ "python", "recommendation_server.py" ]