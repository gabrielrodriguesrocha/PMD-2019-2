#!/bin/bash

sudo docker run -d --name db -p 8091-8094:8091-8094 -p 11210:11210 couchbase
sudo docker run -d --name repl1 couchbase
sudo docker run -d --name repl2 couchbase
sudo docker run -d --name repl3 couchbase
sudo docker run -t -i -p 9119:9119 -e COUCHBASE_HOST=192.168.0.24 -e COUCHBASE_PORT=8091 -e COUCHBASE_USERNAME=Administrator -e COUCHBASE_PASSWORD=123456 -d --name=couchbase_exporter travix/couchbase-exporter

sudo docker build -t couchbase_prometheus .
sudo docker run -p 9090:9090 --restart=always --detach=true --name=prometheus couchbase_prometheus
