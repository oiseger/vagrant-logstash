# -*- mode: ruby -*-
# vi: set ft=ruby :

# Vagrantfile API/syntax version. Don't touch unless you know what you're doing!
VAGRANTFILE_API_VERSION = "2"

Vagrant.configure(VAGRANTFILE_API_VERSION) do |config|

  # Take local box "precise64"
  config.vm.box = "precise64"
  config.vm.hostname="logstash"
  # Logstash web interface
  config.vm.network :forwarded_port, guest: 9292, host: 9292

  # Redis, not stricly needed but handy to test agents from outside the VM:
  config.vm.network :forwarded_port, guest: 6379, host: 6379 # ??, protocol: 'udp'

  # Elasticsearch:
  config.vm.network :forwarded_port, guest: 9200, host: 9200 
  config.vm.provision :shell, :path => "bootstrap.sh"

  config.vm.provider :virtualbox do |vb|
     vb.customize ["modifyvm", :id, "--memory", "1024"]
  end
end
