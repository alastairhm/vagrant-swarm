# -*- mode: ruby -*-
# vi: set ft=ruby :

# Vagrantfile API/syntax version. Don't touch unless you know what you're doing!
VAGRANTFILE_API_VERSION = "2"

Vagrant.configure(VAGRANTFILE_API_VERSION) do |config|

  config.vm.box = "ubuntu/xenial64"

  # The url from where the 'config.vm.box' box will be fetched if it
  # doesn't already exist on the user's system.
  # config.vm.box_url = "http://tom.davidson.me.uk/dev/vagrant/centos63-32.box"

  # Boot with a GUI so you can see the screen. (Default is headless)
  # config.vm.boot_mode = :gui

  # Assign this VM to a host-only network IP, allowing you to access it
  # via the IP. Host-only networks can talk to the host machine as well as
  # any other machines on the same network, but cannot be accessed (through this
  # network interface) by any external networks.
  # config.vm.network :hostonly, "192.168.33.10"

  # Assign this VM to a bridged network, allowing you to connect directly to a
  # network using the host's network device. This makes the VM appear as another
  # physical device on your network.
  # config.vm.network :bridged

  # Forward a port from the guest to the host, which allows for outside
  # computers to access the VM, whereas host only networking does not.

config.vm.define "manager" do |rm|
  rm.vm.box = "ubuntu/xenial64"
  rm.vm.hostname = "manager"
  rm.vm.network "private_network", type: "dhcp"
  rm.vm.network :forwarded_port, guest:8080, host:9093
end

config.vm.define "worker1" do |worker1|
  worker1.vm.box = "ubuntu/xenial64"
  worker1.vm.hostname = "worker1"
  worker1.vm.network "private_network", type: "dhcp"
  worker1.vm.network :forwarded_port, guest:8080, host:9094
end

config.vm.define "worker2" do |worker2|
  worker2.vm.box = "ubuntu/xenial64"
  worker2.vm.hostname = "worker2"
  worker2.vm.network "private_network", type: "dhcp"
  worker2.vm.network :forwarded_port, guest:8080, host:9092
end

config.vm.provision "shell", inline: <<-SHELL
     curl -fsSL https://download.docker.com/linux/ubuntu/gpg | sudo apt-key add -
     add-apt-repository "deb [arch=amd64] https://download.docker.com/linux/ubuntu $(lsb_release -cs) stable"
     apt-get update
     apt-cache policy docker-ce
     apt-get install -y docker-ce
SHELL

end
