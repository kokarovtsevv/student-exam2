FROM python:3.6.9-alpine

WORKDIR /app

COPY . .

RUN pip install .

EXPOSE 5000

CMD export FLASK_APP=js_example && flask run --host 0.0.0.0
