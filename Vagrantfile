Vagrant.configure("2") do |config|
  config.vm.box = "debian/buster64"
  config.vm.guest = "debian"

  config.vm.base_mac = "0800270BCA25"
  config.vm.network "public_network",
                    bridge: "lan0",
                    ip: "192.168.201.254",
                    netmask: "255.255.255.0"
  config.vm.network "private_network",
                    virtualbox__intnet: "intnet",
                    ip: "192.168.202.254",
                    netmask: "255.255.255.0"
  config.vm.hostname = "drbl.clonenet"
  
  config.vm.provider "virtualbox" do |vb|
    vb.name = "drbl"
    vb.gui = true
    vb.memory = "512"
  end
end
