FROM python:3.8
WORKDIR /app
COPY app/requirements.txt requirements.txt
COPY app/config.json config.json
RUN pip3 install --upgrade pip
RUN pip3 install -r requirements.txt
RUN apt update -y
RUN apt install -y nano
COPY app/istio-test.py istio-test.py
ENV FLASK_APP=istio-test.py
ENV FLASK_ENV=development
ENV FLASK_DEBUG=1
ENV VERSION=0.0.2
EXPOSE 8080
CMD [ "flask", "run", "--host=0.0.0.0", "--port=8080"]
