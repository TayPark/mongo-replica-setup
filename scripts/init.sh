echo "Wait for replica setup..."
until mongo --host mongodb1 --eval "print(\"waited for connection\")"
do
    sleep 2
done
echo "Starting replica setup..."
mongo --host mongodb1 << EOF
   var cfg = {
        "_id": "mongo-repl",
        "version": 1,
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

    rs.initiate(cfg, { force: true });

    rs.status();
EOF
echo "Replica setup completed!"