#Huidig bestand weghalen
mysql-module-rm:
  file.absent:
    - name: /etc/metricbeat/modules.d/mysql.yml.disabled

#Nieuw config bestand overzetten
mysql-module-conf:
  file.managed:
    - name: /etc/metricbeat/modules.d/mysql.yml
    - source: salt://wordpress/mysql.yml

#Metricbeat mysql module inschakelen
metricbeat modules enable mysql:
  cmd.run
