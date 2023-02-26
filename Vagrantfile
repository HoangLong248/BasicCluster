BOX_IMAGE = "centos/7"
MEMORY_WORKER = "4028"
MEMORY_MASTER = "2048"
MEMORY_CONTROLLER = "2048"

Vagrant.configure("2") do | config | 
  config.vm.provision :shell , :path => "scripts/add_user.sh", :run => 'always'
  config.vm.provision :shell, :path => "scripts/config_dns.sh", :run => "always"
  config.vm.box = BOX_IMAGE
  # config.vm.box_version = "5.0.0"

  # Worker
  (1..1).each do | i |
    config.vm.define "worker#{i}" do | worker |
      worker.vm.hostname = "worker#{i}"
      worker.vm.network :private_network, ip: "192.168.10.#{i + 20}"
      worker.vm.provider "virtualbox" do | vb |
        vb.memory = MEMORY_WORKER
        vb.cpus = 2
      end
    end
  end

  # Master
  config.vm.define "master1" do | master |
    master.vm.hostname = "master1"
    master.vm.network :private_network, ip: "192.168.10.10"
    master.vm.provider "virtualbox" do | vb |
      vb.memory = MEMORY_MASTER
    end
  end

  # Controller 
  config.vm.define "ansible_controller" do | ansible_controller |
    ansible_controller.vm.hostname = "ansible-controller"
    ansible_controller.vm.network :private_network, ip: "192.168.10.5"
    ansible_controller.vm.provider "virtualbox" do | vb |
      vb.memory = MEMORY_CONTROLLER
    end
    # ansible_controller.vm.provision :shell , :path => "scripts/install_python3.8.sh", :run => 'always'
  end
end