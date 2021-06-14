#Huidig bestand weghalen
apache-module-rm:
  file.absent:
    - name: /etc/metricbeat/modules.d/apache.yml.disabled

#Nieuw config bestand overzetten
apache-module-conf:
  file.managed:
    - name: /etc/metricbeat/modules.d/apache.yml
    - source: salt://wordpress/apache.yml

{% set ip = salt['network.interfaces']()['ens33']['inet'][0]['address'] %}

#Config aanpassen naar juiste IP
set_host_apache:
  file.replace:
    - name: /etc/metricbeat/modules.d/apache.yml
    - pattern: '192.168.32.132"]'
    - repl: '{{ ip }}"]'

#Metricbeat apache module inschakelen
metricbeat modules enable apache:
  cmd.run
