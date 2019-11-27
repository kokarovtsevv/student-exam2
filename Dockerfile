FROM python:3.6.9-alpine

WORKDIR /app

COPY . .

RUN pip install .

EXPOSE 5000

COPY start.sh /
ENTRYPOINT ["sh","/start.sh"]
#CMD export FLASK_APP=js_example && flask run --host 0.0.0.0
