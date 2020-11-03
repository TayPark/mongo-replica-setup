db = db.getSiblingDB("admin")
db.auth("cladmin", "cladmin")

cfg = {
  _id: "rs0",
  members: [
    { _id: 0, host: "mongodb1:27017" },
    { _id: 1, host: "mongodb2:27017" },
    { _id: 2, host: "mongodb3:27017" }
  ]
};

rs.initiate(cfg);
rs.status();

// keyfile auth needs
/* eplSetInitiate quorum check failed because 
not all proposed set members responded affirmatively: 
mongodb2:27017 failed with command replSetHeartbeat requires authentication, 
mongodb3:27017 failed with command replSetHeartbeat requires authentication */

