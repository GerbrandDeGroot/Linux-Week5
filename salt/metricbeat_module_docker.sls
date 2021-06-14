#Docker module file weghalen
docker-module-rm:
  file.absent:
    - name: /etc/metricbeat/modules.d/docker.yml.disabled

#Metricbeat docker module inschakelen
docker-module-conf:
  file.managed:
    - name: /etc/metricbeat/modules.d/docker.yml
    - source: salt://metricbeat/docker.yml

metricbeat modules enable docker:
  cmd.run

