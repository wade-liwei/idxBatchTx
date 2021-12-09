#!/bin/bash

sudo  docker ps  -f name=node  -aq | xargs sudo  docker rm -f
sudo  docker network rm nameservicenet
