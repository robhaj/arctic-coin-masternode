FROM ubuntu

RUN apt-get update && apt-get install -y build-essential software-properties-common autoconf libssl-dev libboost-dev libboost-chrono-dev libboost-filesystem-dev libboost-program-options-dev libboost-system-dev libboost-test-dev libboost-thread-dev sudo automake git
RUN add-apt-repository ppa:bitcoin/bitcoin -y  && apt-get update
RUN apt-get install libdb4.8-dev bsdmainutils libdb4.8++-dev -y

RUN mkdir ~/arcticcoin && cd ~/arcticcoin
RUN apt-get install wget nano -y

RUN wget https://github.com/ArcticCore/arcticc...

RUN tar -xvf arcticcore-0.12.2-linux64.tar.gz
RUN mv arcticcore-0.12.1/* ./
RUN rm arcticcore-0.12.2-linux64.tar.gz && rm -r arcticcore-0.12.1/

RUN cd && cp ~/arcticcoin/bin/arcticcoind /usr/local/bin/
RUN cp ~/arcticcoin/bin/arcticcoin-cli /usr/local/bin/
RUN cp ~/arcticcoin/bin/arcticcoin-tx /usr/local/bin/

RUN mkdir ~/.arcticcore && cd ~/.arcticcore
COPY ./arcticcoin.conf arcticcoin.conf

CMD ["arcticcoind --daemon"]
