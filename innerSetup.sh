#!/bin/bash

sleep 10 | echo "Wait for setup"

# mongo mongodb://mongodb1:27017 --keyFile /keys/mongodb.key replicaInit.js
mongo mongodb://mongodb1:27017 replicaInit.js