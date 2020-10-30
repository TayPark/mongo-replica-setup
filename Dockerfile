FROM mongo

WORKDIR /usr/src/
RUN mkdir configs  
WORKDIR /usr/src/configs

COPY replicaInit.js .
COPY innerSetup.sh .

RUN chmod +x ./innerSetup.sh

CMD ["./innerSetup.sh"]