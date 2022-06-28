FROM tiangolo/uwsgi-nginx-flask:python3.10

COPY ./app /app

RUN apt-get update && apt-get install -y default-libmysqlclient-dev make python3-pip

RUN make install

CMD uwsgi uwsgi.ini