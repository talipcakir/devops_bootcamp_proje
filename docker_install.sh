#!/bin/bash

# Docker kurulumu için gerekli olan paketleri güncelleyin ve gerekli paketleri yükleyin
sudo apt-get update
sudo apt-get install -y apt-transport-https ca-certificates curl software-properties-common

# Docker'ın resmi GPG anahtarını ekleyin
curl -fsSL https://download.docker.com/linux/ubuntu/gpg | sudo apt-key add -

# Docker'ın kararlı deposunu ekleyin
sudo add-apt-repository "deb [arch=amd64] https://download.docker.com/linux/ubuntu $(lsb_release -cs) stable"

# Paket listelerini güncelleyin ve Docker'ı yükleyin
sudo apt-get update
sudo apt-get install -y docker-ce

# Docker'ın yüklenip yüklenmediğini kontrol edin
sudo systemctl status docker

# Docker grubunu oluşturun (eğer yoksa)
sudo groupadd docker

# Kullanıcıyı docker grubuna ekleyin
sudo usermod -aG docker $USER
