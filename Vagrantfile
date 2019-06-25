# -*- mode: ruby -*-
# vi: set ft=ruby :

ENV['VAGRANT_NO_PARALLEL'] = 'yes'

Vagrant.configure(2) do |config|

  config.vm.provision "shell", path: "bootstrap.sh"

  # Kubernetes Master Server
  config.vm.define "master" do |master|
    master.vm.box = "ubuntu/bionic64"
    master.vm.box_version = "20190612.0.0"
    master.vm.hostname = "master.dojot.com.br"
    master.vm.network "private_network", ip: "172.42.42.100"
    master.vm.network "forwarded_port", guest: 8000, host: 8080
    master.vm.network "forwarded_port", guest: 1883, host: 1883
    master.vm.network "forwarded_port", guest: 8883, host: 8883
    master.vm.provider "virtualbox" do |v|
      v.name = "master"
      v.memory = 2048
      v.cpus = 2
    end
    master.vm.provision "shell", path: "bootstrap_master.sh"
  end

  NodeCount = 2

  # Kubernetes Worker Nodes
  (1..NodeCount).each do |i|
    config.vm.define "worker#{i}" do |workernode|
      workernode.vm.box = "ubuntu/bionic64"
      workernode.vm.box_version = "20190612.0.0"
      workernode.vm.hostname = "worker#{i}.example.com"
      workernode.vm.network "private_network", ip: "172.42.42.10#{i}"
      workernode.vm.provider "virtualbox" do |v|
        v.name = "worker#{i}"
        v.memory = 2048
        v.cpus = 2
      end
      workernode.vm.provision "shell", path: "bootstrap_worker.sh"
    end
  end

end
