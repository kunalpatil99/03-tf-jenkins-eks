#!/bin/bash

exec > /var/log/user-data.log 2>&1

echo "============================"
echo "Updating system"
echo "============================"
yum update -y

echo "============================"
echo "Installing Git"
echo "============================"
yum install -y git

echo "============================"
echo "Installing Java 21 (Corretto)"
echo "============================"
yum install -y java-21-amazon-corretto

echo "============================"
echo "Adding Jenkins repo"
echo "============================"
wget -O /etc/yum.repos.d/jenkins.repo https://pkg.jenkins.io/redhat-stable/jenkins.repo
rpm --import https://pkg.jenkins.io/redhat-stable/jenkins.io-2023.key

echo "============================"
echo "Installing Jenkins"
echo "============================"
yum install -y jenkins

echo "============================"
echo "Starting Jenkins"
echo "============================"
systemctl daemon-reload
systemctl enable jenkins
systemctl start jenkins

echo "============================"
echo "Installing Terraform"
echo "============================"
yum install -y yum-utils
yum-config-manager --add-repo https://rpm.releases.hashicorp.com/RHEL/hashicorp.repo
yum install -y terraform

echo "============================"
echo "Installing kubectl"
echo "============================"
curl -LO "https://dl.k8s.io/release/$(curl -s https://dl.k8s.io/release/stable.txt)/bin/linux/amd64/kubectl"
chmod +x kubectl
mv kubectl /usr/local/bin/

echo "============================"
echo "ALL INSTALLATIONS COMPLETED"
echo "============================"

systemctl status jenkins --no-pager