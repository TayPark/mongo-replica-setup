#!/bin/bash
set -e

sleep 15 | echo Sleeping

mongo mongodb://mongodb1:27017 <<EOF
use $MONGO_INITDB_DATABASE
db.auth('$MONGO_INITDB_ROOT_USERNAME', '$MONGO_INITDB_ROOT_PASSWORD')
cfg = {
  _id: "rs0",
  members: [
    { _id: 0, host: "mongodb1:27017" },
    { _id: 1, host: "mongodb2:27017" },
    { _id: 2, host: "mongodb3:27017" }
  ]
};

rs.initiate(cfg);

rs.conf();
EOF