#!/bin/bash
set -e

mongo <<EOF
use $MONGO_INITDB_DATABASE
db.createUser({
  user:  '$MONGO_INITDB_ROOT_USERNAME',
  pwd: '$MONGO_INITDB_ROOT_PASSWORD',
  roles: [{
    role: ['readWrite', 'dbAdmin', 'userAdmin'],
    db: '$MONGO_INITDB_DATABASE'
  }]
})
db.grantRolesToUser(
   "admin",
   [ {role: "clusterManager", db: "lunarcat"} ]
)
EOF