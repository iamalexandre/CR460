# Étape
1.	Créer les instances requises à l’aide du fichier Terraform, soit : 
•	Réseau VPC
•	L’instance CloudSQL, incluant la base de données et sa configuration
2.	Créer l’instance de cluster Kubernetes
•	Bâtir l'image : docker build.
•	Assigner le nom à l'image : docker tag <imageid> <nom de l'image>
•	S'identifier au hub docker : docker login
•	Publier l’image : docker push
3.	Cloner le répertoire des fichiers à partir de GitHub
•	Git clone https://github.com/iamalexandre/CR460
4.	Effectuer le déploiement du Pod à l’aide du fichier wp-deployment.yaml
5.	Effectuer le déploiement du service à l’aide du fichier wp-service.yaml
6.	Effectuer le déploiement de Ingress à l’aide des fichiers wp-ingress.yaml


Notes pour la base de données
•	Autoriser l’adresse 0.0.0.0/0 dans CloudSQL pour rendre l’accès public.
•	Utiliser le jeu de caractères utf8mb4 pour la création de la base de données.
