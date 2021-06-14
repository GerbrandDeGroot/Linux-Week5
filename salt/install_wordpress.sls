#Wordpress package installeren
wordpress-install:
  pkg.installed:
    - pkgs:
      - wordpress
      - php
      - libapache2-mod-php
      - mysql-server
      - php-mysql

#Controleren of apache2 service al draait, zo niet, schakel deze in.
apache2:
  service.running:
    - enable: True

#Controleren of de Mysql-server service al draait, zo niet, schakel deze in.
mysql:
  service.running:
    - enable: True

#Wordpress configuratie van de Master naar de Minion kopieren
wordpress-conf:
  file.managed:
    - name: /etc/apache2/sites-available/wordpress.conf
    - source: salt://wordpress/wordpress.conf

#Site aanzetten en apache2 herladen
a2ensite wordpress:
  cmd.run

service apache2 reload:
  cmd.run
