# Image de base
FROM ubuntu:16.04

#Installation d'apache
RUN apt-get update
RUN apt-get install -y apache2 libapache2-mod-php
RUN a2enmod php7.0

# Add wordpress files
ADD wordpress/ /var/www/html/wordpress


# Identifie quelle commande rouler
ENTRYPOINT  ["/usr/sbin/apache2ctl", "-D", "FOREGROUND"]
