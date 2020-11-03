#!/bin/bash
set -e

echo "

====================================
dbinit.sh
====================================

"
mongo <<EOF
admin = db.getSiblingDB("admin")
admin.createUser({
  user: "admin",
  pwd: "admin",
  roles: [{ role: "userAdminAnyDatabase", db: "admin" }]
})

admin.createUser({
  user: "cladmin",
  pwd: "cladmin",
  roles: [{ role: "clusterAdmin", db: "admin" }]
})

db.getSiblingDB("$MONGO_INITDB_DATABASE").createUser({
  user: "$MONGO_INITDB_ROOT_USERNAME",
  pwd: "$MONGO_INITDB_ROOT_PASSWORD",
  roles: [{ role: "readWrite", db: "$MONGO_INITDB_DATABASE" }]
})
EOF