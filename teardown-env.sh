#!/bin/bash

docker stop some-mysql wordpress-instance
docker rm some-mysql wordpress-instance
sudo rm -r ./data/
