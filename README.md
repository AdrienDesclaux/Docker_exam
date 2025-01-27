# Docker_exam

Step 1. Create a network =>

- `docker network create --driver bridge --subnet=172.1.1.0/24 MyBridgedNetwork`

Step 2. Deploy an nginx image on the network =>

- `docker run -d --name nginx_container --network MyBridgedNetwork -p 8000:80 nginx`

Step 3. Modify HTML page of nginx =>

- `docker exec -it nginx_container bash`
- `cd usr/share/nginx/html`
- `echo "Voici ma page HTML modifié" > index.html`
- `exit`

Step 4. Commit et redéploiement =>

- `docker commit nginx_container adrien_custom_nginx`
- `docker run -d -P --name adrien_nginx --network MyBridgedNetwork -p 8081:80 adrien_custom_nginx`

Step 5. Création BDD + Volume =>

- `docker volume create bdd`
- `docker run -d --name mongo_container --network MyBridgedNetwork -v bdd:/data/db mongo`

Step 6. Ajout de mongo-express =>

- `docker run -d --name mongo_express --network MyBridgedNetwork -e ME_CONFIG_MONGODB_SERVER=mongo_container mongo-express`

Step 7. Création du second network =>

- `docker network create --driver bridge --subnet=172.2.2.0/24 BCNetwork`

Step 8. Push du client node =>

- `docker build -t eth-node .`
- `docker login -u adriendesclaux`
- `docker tag eth-node adriendesclaux/eth-node`
- `docker push adriendesclaux/eth-node`

Step 9. Create volume and run the eth node =>

- `docker volume create blockchain`
- `docker run -d --name ethereum_node --network BCNetwork -v blockchain:/root/.ethereum adriendesclaux/eth-node`
