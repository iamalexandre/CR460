# Image de base
FROM ubuntu:16.04

#Installation d'apache
RUN apt-get update
RUN apt-get install -y apache2

# Add wordpress files
ADD wordpress/ /var/www/wordpress

# Identifie quelle commande rouler
ENTRYPOINT  ["/usr/sbin/apache2ctl", "-D", "FOREGROUND"]
