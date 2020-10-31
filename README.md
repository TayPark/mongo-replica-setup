# mongo-repl-setup
This repo is for setup a MongoDB replica set with `docker-compose`

- How to
```s
git clone https://github.com/TayPark/mongo-replica-setup.git
cd mongo-replica-setup
docker build -t repl-helper .
docker-compose up
```

- Connection URI
```s
# By default, accrording to MongoDB docs, URI below is an example of this repo
mongodb://localhost:27017,localhost:27018,localhost:27019,localhost:27020,localhost:27021/dbname

# if you want to shorten, use instruction below to get primary node
docker exec -it mongodb1 mongo --eval "rs.isMaster().primary | tail -1"

# if stdout is mongodb5:27017, try like this
mongodb://localhost:27021/dbname

# also you can use docker container's 
docker network mongo-replica-setup_backend | jq '.[0].Containers'
```

```json
{
  "92b76082c9ce70fb1565a91c8763160b6f3431e85c8571d3968d5d895591d97d": {
    "Name": "mongodb4",
    "EndpointID": "602b7b18b97cead4c443b16d04dfc149a67fba27c9ebb2b4fd10a6dc7671e59b",
    "MacAddress": "02:42:ac:14:00:03",
    "IPv4Address": "172.20.0.3/16",
    "IPv6Address": ""
  },
  "e3fded1007737ff32797187e9054ae35fd9d9318247826d71eaa6e4ce3fec9f5": {
    "Name": "mongodb5",
    "EndpointID": "b25f14495bbbc475d7bf7a8359bc7bb8e1769b10ef73c54340102faf91f3285e",
    "MacAddress": "02:42:ac:14:00:02",
    "IPv4Address": "172.20.0.2/16",
    "IPv6Address": ""
  },
  "eaeee5bd34a10c22cd952012aa3768b2e9bd455be2ccc430b6f79f1da71c1403": {
    "Name": "mongodb2",
    "EndpointID": "2a227c9f6d032725f62eb58371cc43d8e29cdf07b54e095adb0d74467567ae06",
    "MacAddress": "02:42:ac:14:00:05",
    "IPv4Address": "172.20.0.5/16",
    "IPv6Address": ""
  },
  "f3c4a2a4ae9bfc6cf156105c3be995b13eef9256604902afd67922c7ed6ddd42": {
    "Name": "mongodb1",
    "EndpointID": "a27623cdae553b4b12242caab8ae0a6e832f45bd2c1aef6d8607a516970d6d68",
    "MacAddress": "02:42:ac:14:00:06",
    "IPv4Address": "172.20.0.6/16",
    "IPv6Address": ""
  },
  "fd9bbbb6a1ecb9c536d2802687af23dd15dcf9fc1d3e97d8dca3e3eca1074ab8": {
    "Name": "mongodb3",
    "EndpointID": "106f5750befecc72414ee3af6593df2f37d6b6d6be24b06248be677e8cc03b88",
    "MacAddress": "02:42:ac:14:00:04",
    "IPv4Address": "172.20.0.4/16",
    "IPv6Address": ""
  }
}
```

then, pick `172.20.0.4` as your connection string

```s
mongodb://172.20.0.2:27017/dbname
```

## License

MIT