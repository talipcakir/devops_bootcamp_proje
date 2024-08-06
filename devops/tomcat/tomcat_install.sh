#!/bin/bash

# Gerekli paketleri güncelleyin ve yükleyin
sudo apt-get update
sudo apt-get install -y openjdk-11-jdk wget

# Tomcat versiyonunu belirleyin
TOMCAT_VERSION=9.0.72

# Tomcat'i indirin
wget https://archive.apache.org/dist/tomcat/tomcat-9/v${TOMCAT_VERSION}/bin/apache-tomcat-${TOMCAT_VERSION}.tar.gz

# Tomcat'i açın
sudo tar xzf apache-tomcat-${TOMCAT_VERSION}.tar.gz -C /opt

# Sembolik link oluşturun
sudo ln -s /opt/apache-tomcat-${TOMCAT_VERSION} /opt/tomcat

# Tomcat kullanıcılarını ve gruplarını oluşturun
sudo groupadd tomcat
sudo useradd -s /bin/false -g tomcat -d /opt/tomcat tomcat

# Yetkileri ayarlayın
sudo chown -R tomcat: /opt/apache-tomcat-${TOMCAT_VERSION}
sudo chmod -R u+rwx /opt/apache-tomcat-${TOMCAT_VERSION}

# Tomcat servisini başlatın
sudo /opt/tomcat/bin/startup.sh
