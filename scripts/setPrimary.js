var cfg = {
  "_id": "mongo-repl",
  "members": [
      {
          "_id": 0,
          "host": "mongodb1:27017",
      },
      {
          "_id": 1,
          "host": "mongodb2:27017",
      },
      {
          "_id": 2,
          "host": "mongodb3:27017",
      }
  ]
};

rs.initiate(cfg);

var rs1 = (new Mongo('mongodb2:27017'))
var rs2 = (new Mongo('mongodb3:27017'))

rs1.setSecondaryOk()
rs2.setSecondaryOk()

rs.status();
