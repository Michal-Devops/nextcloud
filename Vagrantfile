# -*- mode: ruby -*-
# vi: set ft=ruby :

Vagrant.configure("2") do |config|
    # Wybór obrazu systemu operacyjnego na CentOS 7
    config.vm.box = "ubuntu/focal64"
  
    # Konfiguracja sieci
    # Ustawienie statycznego adresu IP w zakresie 192.168.56.1/24
    config.vm.network "private_network", ip: "192.168.56.10"
  
    # Konfiguracja zasobów maszyny wirtualnej
    config.vm.provider "virtualbox" do |vb|
      # Ustawienie ilości pamięci RAM na 1 GB
      vb.memory = "1024"
  
      # Ustawienie ilości rdzeni procesora
      vb.cpus = 1
    end
  
  end
  