#!/bin/bash

# configure
ecs-cli configure --region us-east-1 --cluster foodtrucks

# setup cloud formation template
ecs-cli up --keypair ecs --capability-iam --size 1 --instance-type t2.medium

# deploy
ecs-cli compose --file docker-compose.yml up

# check
ecs-cli ps
