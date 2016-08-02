#!/bin/bash

docker stop hf-mysql hf-wordpress
docker rm hf-mysql hf-wordpress
sudo rm -r ./data/
