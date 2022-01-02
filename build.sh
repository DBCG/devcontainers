#!/bin/bash

cd ig
docker build -t contentgroup/dev-ig:latest .
docker push contentgroup/dev-ig:latest
cd ..