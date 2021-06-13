#!/bin/bash
# Dit script installeert salt-minion op de target machine en stelt de salt-master in.
# Daarnaast voegt het de salt-minion key toe aan de salt-master
# Dit script dient met root rechten uitgevoerd te worden

#dependencies: sshpass
#STAP 1: INSTALLATIE
#tijdens installatie IP van nieuwe machine noteren en hieronder noteren bij SALT_MINION
#daarnaast OpenSSH installeren
# STAP 2: CONFIGURATIE
#nano /etc/ssh/sshd_config
#PermitRootLogin yes
#dan root password instellen
#sudo passwd root
#systemctl restart ssh
# STAP 3: LOSSE SSH SESSIE VOOR KEYS
#eerst een ssh sessie starten met ssh gerbrand@salt-minion voor het genereren van keys

#parameters aanpassen en opslaan
SALT_MINION=192.168.32.140
SALT_MINION_POORT=22
WACHTWOORD_MINION=server8
SALT_MASTER=192.168.32.132
HOSTNAME_MINION=ubuntuserver8

sshpass -p $WACHTWOORD_MINION ssh -T root@$SALT_MINION -p $SALT_MINION_POORT -y <<-SSH

# Download key
sudo curl -fsSL -o /usr/share/keyrings/salt-archive-keyring.gpg https://repo.saltproject.io/py3/debian/10/amd64/latest/salt-archive-keyring.gpg
# Create apt sources list file
echo "deb [signed-by=/usr/share/keyrings/salt-archive-keyring.gpg] https://repo.saltproject.io/py3/debian/10/amd64/latest buster main" | sudo tee /etc/apt/sources.list.d/salt.list
apt-get update
apt-get install salt-minion -y

sed -i "s/^#master:.*/master: "$SALT_MASTER"/" /etc/salt/minion
systemctl restart salt-minion

SSH

#accepteer key van minion
salt-key --list-all
salt-key --accept=$HOSTNAME_MINION -y

echo 'Einde script'
