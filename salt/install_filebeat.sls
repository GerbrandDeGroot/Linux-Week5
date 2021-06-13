#Filebeat repository aanmaken
filebeat-repository:
  pkgrepo.managed:
    - humanname: Filebeat
    - name: deb https://artifacts.elastic.co/packages/7.x/apt stable main
    - dist: stable
    - gpgcheck: 1
    - key_url: https://artifacts.elastic.co/GPG-KEY-elasticsearch

#Filebeat package installeren
filebeat-install:
  pkg.installed:
    - pkgs:
      - filebeat

#Filebeat configuratie van de Master naar de Minion kopieren
filebeat-conf:
  file.managed:
    - name: /etc/filebeat/filebeat.yml
    - source: salt://filebeat/filebeat.yml

#Filebeat modules inschakelen
filebeat modules enable system:
  cmd.run

#Controleren of de Filebeat service al draait, zo niet, schakel deze in.
filebeat:
  service.running:
    - enable: True
