#Metricbeat package installeren
metricbeat-install:
  pkg.installed:
    - pkgs:
      - metricbeat

#Controleren of de Metricbeat service al draait, zo niet, schakel deze in.
metricbeat:
  service.running:
    - enable: True

#Metricbeat configuratie van de Master naar de Minion kopieren
metricbeat-conf:
  file.managed:
    - name: /etc/metricbeat/metricbeat.yml
    - source: salt://metricbeat/metricbeat.yml

#Metricbeat modules inschakelen
metricbeat modules enable docker:
  cmd.run
