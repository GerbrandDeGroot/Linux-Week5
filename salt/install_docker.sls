#Voot het downloaden van de repository over HTTPS
https_install:
  pkg.installed:
    - pkgs:
      - apt-transport-https
      - ca-certificates
      - curl
      - gnupg
      - lsb-release

#Docker repository van de Master naar de Minion kopieren
docker-conf-key:
  file.managed:
    - name: /usr/share/keyrings/docker-archive-keyring.gpg
    - source: salt://docker/docker-archive-keyring.gpg

curl -fsSL https://download.docker.com/linux/ubuntu/gpg | sudo apt-key add -:
  cmd.run

docker-conf-sources-list:
  file.replace:
    - name: /etc/apt/sources.list
    - pattern: deb [arch=amd64] https://download.docker.com/linux/ubuntu focal stable 
    - repl: deb [arch=amd64] https://download.docker.com/linux/ubuntu focal stable
    - append_if_not_found: True

#Docker package installeren
docker-install:
  pkg.installed:
    - pkgs:
      - docker-ce
      - docker-ce-cli
      - containerd.io

#Controleren of de Docker service al draait, zo niet, schakel deze in.
docker:
  service.running:
    - enable: True
