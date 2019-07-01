#!/bin/bash

kubeadm init --apiserver-advertise-address=192.168.33.10 --pod-network-cidr=10.244.0.0/16 >> /root/kubeinit.log 2>/dev/null

mkdir /home/vagrant/.kube
cp /etc/kubernetes/admin.conf /home/vagrant/.kube/config
chown -R vagrant:vagrant /home/vagrant/.kube

su - vagrant -c "kubectl apply -f https://raw.githubusercontent.com/coreos/flannel/62e44c867a2846fefb68bd5f178daf4da3095ccb/Documentation/kube-flannel.yml"

kubeadm token create --print-join-command > /vagrant/joincluster.sh

apt-get install -y python-pip