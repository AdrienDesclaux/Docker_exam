A l’aide du terminal et des Dockerles nécessaires :

- Vous générerez un network bridgé nommé MyBridgedNetwork avec pour plage ip 172.1.1.0/24
- Vous déploierez un conteneur Nginx sur MyBridgedNetwork
- Edit de la page index Nginx
- Commit du conteneur et redéploiement
- Vous déploierez un conteneur mongo pour votre bdd sur MyBridgedNetwork
- Vous rattacherez un volume “bdd” à votre conteneur mongo
- Déploiement Mongo-express
- Vous créerez un second network nommé BCNetwork 172.2.2.0/24
- Vous y déploierez un conteneur d’un noeud Ethereum (sur BCNetwork) que vous aurez vous
  même buildé et push sur dockerhub au préalable (dockerfile à l’appui).
- Vous rattacherez un volume “blockchain” à votre noeud Ethereum afin de conserver le registre
  de la blockchain de façon persistante.
  A l’aide d’un fichier compose.yaml :
- Réitérer la même configuration en apportant les modifications suivantes :
  ● Votre conteneur web ne démarre que si le conteneur de base de
  donnée est UP.
  ● Votre conteneur de noeud ETH est buildé depuis le dockerfile local.
