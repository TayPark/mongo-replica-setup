This repo is for setup a MongoDB replica set with `docker-compose`

- Flow

```s
# Optional, if you have data directory
sudo rm -rf data

git clone https://github.com/TayPark/mongo-replica-setup.git
docker build -t repl-helper .
docker-compose up
```

- Connection URI

```s
mongodb://localhost:27017,localhost:27018,localhost:27019,localhost:27020/?replicaSet=rs0
```

