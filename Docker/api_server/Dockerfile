# syntax=docker/dockerfile:1

FROM python:3.9.2

WORKDIR /Cuple_API
COPY requirements.txt requirements.txt
COPY app.py app.py
RUN pip3 install -r requirements.txt

CMD [ "python3", "-m" , "flask", "run", "--host=0.0.0.0"]