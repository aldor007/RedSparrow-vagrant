# -*- mode: ruby -*-
# vi: set ft=ruby :

# Vagrantfile API/syntax version. Don't touch unless you know what you're doing!
VAGRANTFILE_API_VERSION = "2"

Vagrant.configure(VAGRANTFILE_API_VERSION) do |config|
  # All Vagrant configuration is done here. The most common configuration
  # options are documented and commented below. For a complete reference,
  # please see the online documentation at vagrantup.com.

  # Every Vagrant virtual environment requires a box to build off of.
  config.vm.box = "oberger/debianjessiemini-amd64"

  # Disable automatic box update checking. If you disable this, then
  # boxes will only be checked for updates when the user runs
  # `vagrant box outdated`. This is not recommended.
  # config.vm.box_check_update = false

  # Create a forwarded port mapping which allows access to a specific port
  # within the machine from a port on the host machine. In the example below,
  # accessing "localhost:8080" will access port 80 on the guest machine.
  config.vm.network "forwarded_port", guest: 80, host: 8080

  # Create a private network, which allows host-only access to the machine
  # using a specific IP.
  config.vm.network "private_network", ip: "10.165.53.105"
# Port Forwarding for:
  ## NginX
  ## MySQL
  config.vm.network "forwarded_port", guest: 3306, host: 33060
  ## MongoDB
  config.vm.network "forwarded_port", guest: 27017, host: 20017
  ## Redis
  config.vm.network "forwarded_port", guest: 6379, host: 63790
  
  # Allow more memory and fix this problem : http://askubuntu.com/questions/238040/how-do-i-fix-name-service-for-vagrant-client
  config.vm.provider "virtualbox" do |v|
    # v.gui = true
    v.memory = 1024
    v.customize ["modifyvm", :id, "--natdnshostresolver1", "on"]
    v.customize ["modifyvm", :id, "--natdnsproxy1", "on"]
  end

  config.vm.provision "shell" do |sh|
    sh.path = "windows/provision.sh"
    sh.args = "./ansible ansible/main.yml ansible/hosts"
  end
end
