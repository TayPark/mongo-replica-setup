FROM mongo

RUN mkdir -p /usr/src/configs  
WORKDIR /usr/src/configs

COPY replicaInit.js .
COPY innerSetup.sh .

RUN chmod +x ./innerSetup.sh

CMD ["./innerSetup.sh"]