# mongo-repl-setup
This repo is for setup a MongoDB replica set with `docker-compose`

## How to

```s
git clone https://github.com/TayPark/mongo-replica-setup.git
cd mongo-replica-setup
cd server
npm install or yarn install
cd ..

# make key
openssl rand -base64 756 > mongodb.key
sudo chown 999:999 mongodb.key
sudo chmod 400 mongodb.key

# make .env
vi .env
```

```s
# .env
MONGO_URI=mongodb://localhost:27017,localhost:27018,localhost:27019/repltest?replicaSet=rs0

MONGO_INITDB_ROOT_USERNAME=testuser
MONGO_INITDB_ROOT_PASSWORD=testpw
MONGO_INITDB_DATABASE=testdb
```

then

```s
docker-compose up --build
```

That's it!
