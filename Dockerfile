# Image de base Robert
FROM ubuntu:16.04

#Installation d'apache
RUN sudo apt-get update
RUN sudo apt-get install -y apache2 libapache2-mod-php php-mysql gettext-base
RUN sudo a2enmod php7.0


# Add wordpress files
ADD sudo wordpress/ /var/www/html/wordpress
RUN sudo a2enmod php7.0
RUN sudo chmod 0777 /var/www/html/wordpress
ADD sudo wp-config.php-template /var/www/html/wordpress
ADD sudo entrypoint.sh /

# Identifie quelle commande rouler
ENTRYPOINT  ["/bin/bash", "/entrypoint.sh"]
