FROM mongo

RUN mkdir /usr/src/configs  
WORKDIR /usr/src/configs

COPY innerSetup.sh .

RUN chmod +x ./innerSetup.sh

CMD ["./innerSetup.sh"]