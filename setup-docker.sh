#!/bin/bash

# build the flask container
docker build -t reneab/food-trucks .

# create the network
docker network create foodtrucks-net

# start the ES container
docker run -d --name es --net foodtrucks-net -p 9200:9200 -p 9300:9300 -e "discovery.type=single-node" elasticsearch:6.8.13

# start the flask app container
docker run -d --name foodtrucks-web --net foodtrucks-net -p 5000:5000  reneab/food-trucks
