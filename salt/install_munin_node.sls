#Munin-node package installeren
munin-node-install:
  pkg.installed:
    - pkgs:
      - munin-node

#Munin-node configuratie van de Master naar de Minion kopieren
munin-conf:
  file.managed:
    - name: /etc/munin/munin-node.conf
    - source: salt://munin-node/munin-node.conf

#grains.get ip4_interfaces:ens33
set_host:
  file.replace:
    - name: /etc/munin/munin-node.conf
    - pattern: 'host 192.168.32.132'
    - repl: 'host {{salt['grains.get']('ip4interfaces')('ens33')[1]}}'

set_host_name:
  file.replace:
    - name: /etc/munin/munin-node.conf
    - pattern: 'host_name ubuntuserver1'
    - repl: 'host_name {{grains['fqdn']}}'

#Controleren of de munin-node service al draait, zo niet, schakel deze in.
munin-node:
  service.running:
    - enable: True
    - reload: True

