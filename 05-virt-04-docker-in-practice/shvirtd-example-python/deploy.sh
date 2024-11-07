#!/bin/bash

cd /opt

git clone https://github.com/greengorych/SHDEVOPS-10.git

cd SHDEVOPS-10/05-virt-04-docker-in-practice/shvirtd-example-python

docker compose up -d