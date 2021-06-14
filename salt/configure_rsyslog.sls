#Rsyslog configuratie van de Master naar de Minion kopieren
rsyslog-conf:
  file.managed:
    - name: /etc/rsyslog.conf
    - source: salt://rsyslog/rsyslog.conf

rsyslog-default-conf:
  file.managed:
    - name: /etc/rsyslog.d/50-default.conf
    - source: salt://rsyslog/50-default.conf

#Rsyslog service herstarten
systemctl restart rsyslog:
  cmd.run
