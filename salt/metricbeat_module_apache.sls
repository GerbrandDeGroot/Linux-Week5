#Huidig bestand weghalen
apache-module-rm:
  file.absent:
    - name: /etc/metricbeat/modules.d/apache.yml.disabled

#Nieuw config bestand overzetten
apache-module-conf:
  file.managed:
    - name: /etc/metricbeat/modules.d/apache.yml
    - source: salt://wordpress/apache.yml

#Metricbeat apache module inschakelen
metricbeat modules enable apache:
  cmd.run
