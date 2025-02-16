FROM ethereum/client-go

WORKDIR /ethereum

VOLUME [ "/root/ethereum" ]

EXPOSE 8545

CMD ["--http", "--http.addr", "0.0.0.0", "--http.port", "8545", "--syncmode", "full", "--mainnet", "--datadir", "/root/ethereum"]
