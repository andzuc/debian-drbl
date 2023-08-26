Vagrant.configure("2") do |config|
  config.vm.box = "debian/buster64"
  config.vm.define :drbl
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
  config.vm.disk :disk, size: "10GB", name: "docker_storage"
  
  config.vm.provision "bootstrap", type: "shell" do |s|
    s.path = "bootstrap.sh"
  end
  
  config.vm.provision "ansible", type: "ansible_local" do |ansible|
    ansible.install = "false"
    ansible.verbose = "v"
    ansible.playbook = "playbook.yml"
  end
  
  config.vm.provider "virtualbox" do |vb|
    vb.name = "drbl"
    vb.gui = false
    vb.memory = "1024"
    # custom storage
    vb.customize [ 'storagectl', :id, '--name', 'SATA Controller', '--portcount', 3]
    vb.customize [ 'storageattach', :id, '--storagectl', 'SATA Controller', '--port', 2, '--device', 0, '--type', 'hdd', '--medium', "/opt/vbox/media/hdz/zcloner/vg0_20121015/zcloner_vg0_pv0.vdi"]
  end
end
