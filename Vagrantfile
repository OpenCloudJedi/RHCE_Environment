# -*- mode: ruby -*-
# vi: set ft=ruby :
disk1 = './disk-0-1.vdi'
disk2 = './disk-0-2.vdi'
disk3 = './disk-0-3.vdi'
disk4 = './disk-0-4.vdi'
disk5 = './disk-0-5.vdi'
disk6 = './disk-0-6.vdi'
disk7 = './disk-0-7.vdi'
disk8 = './disk-0-8.vdi'
disk9 = './disk-0-9.vdi'
disk10 = './disk-0-10.vdi'
disk11 = './disk-0-11.vdi'
Vagrant.configure("2") do |config|
  # Base VM OS configuration.
  config.ssh.insert_key = false
  config.vm.synced_folder '.', '/vagrant', disabled: true
  # General VirtualBox VM configuration.
  config.vm.provider :virtualbox do |v|
    v.memory = 1024
    v.cpus = 1
    v.linked_clone = true
    v.customize ["modifyvm", :id, "--natdnshostresolver1", "on"]
    v.customize ["modifyvm", :id, "--ioapic", "on"]
  end
  # control.
  config.vm.define "control" do |control|
    control.vm.box = "bento/centos-8.3"
    control.vm.hostname = "control.test"
    control.vm.network :private_network, ip: "192.168.2.2"
#    control.vm.provision "shell",
#      inline: "sudo yum update -y"
    control.vm.provider :virtualbox do |v|
      v.customize ["modifyvm", :id, "--memory", 768]
    end
  end
  # Server1.
  config.vm.define "server1" do |server1|
    server1.vm.box = "bento/centos-8.3"
    server1.vm.hostname = "server4.test"
    server1.vm.network :private_network, ip: "192.168.2.3"
 #   server1.vm.provision "shell",
 #     inline: "sudo yum update -y"
    server1.vm.provider :virtualbox do |v|
      v.customize ["modifyvm", :id, "--memory", 768]
      unless File.exist?(disk1)
        v.customize ['createhd', '--filename', disk1, '--variant', 'Standard', '--size', 256]
        v.customize ['createhd', '--filename', disk2, '--variant', 'Standard', '--size', 256]
        v.customize ['createhd', '--filename', disk3, '--variant', 'Standard', '--size', 256]
        v.customize ['storageattach', :id,  '--storagectl', 'SATA Controller', '--port', 2, '--device', 0, '--type', 'hdd', '--medium', disk1] 
        v.customize ['storageattach', :id,  '--storagectl', 'SATA Controller', '--port', 3, '--device', 0, '--type', 'hdd', '--medium', disk2] 
        v.customize ['storageattach', :id,  '--storagectl', 'SATA Controller', '--port', 4, '--device', 0, '--type', 'hdd', '--medium', disk3] 
      end 
    end
  end
  # Server2.
  config.vm.define "server2" do |server2|
    server2.vm.box = "bento/centos-8.3"
    server2.vm.hostname = "server2.test"
    server2.vm.network :private_network, ip: "192.168.2.4"
 #   server2.vm.provision "shell",
 #     inline: "sudo yum update -y"
    server2.vm.provider :virtualbox do |v|
      v.customize ["modifyvm", :id, "--memory", 768]
      unless File.exist?(disk4)
        v.customize ['createhd', '--filename', disk4, '--variant', 'Standard', '--size', 256]
        v.customize ['createhd', '--filename', disk5, '--variant', 'Standard', '--size', 256]
        v.customize ['createhd', '--filename', disk6, '--variant', 'Standard', '--size', 256]
        v.customize ['storageattach', :id,  '--storagectl', 'SATA Controller', '--port', 2, '--device', 0, '--type', 'hdd', '--medium', disk4] 
        v.customize ['storageattach', :id,  '--storagectl', 'SATA Controller', '--port', 3, '--device', 0, '--type', 'hdd', '--medium', disk5] 
        v.customize ['storageattach', :id,  '--storagectl', 'SATA Controller', '--port', 4, '--device', 0, '--type', 'hdd', '--medium', disk6] 
      end
    end
  end
  # Server3.
  config.vm.define "server3" do |server3|
    server3.vm.box = "bento/centos-8.3"
    server3.vm.hostname = "server3.test"
    server3.vm.network :private_network, ip: "192.168.2.5"
 #   server3.vm.provision "shell",
 #     inline: "sudo yum update -y"
    server3.vm.provider :virtualbox do |v|
      v.customize ["modifyvm", :id, "--memory", 768]
      unless File.exist?(disk7)
        v.customize ['createhd', '--filename', disk7, '--variant', 'Standard', '--size', 256]
        v.customize ['createhd', '--filename', disk8, '--variant', 'Standard', '--size', 256]
        v.customize ['storageattach', :id,  '--storagectl', 'SATA Controller', '--port', 2, '--device', 0, '--type', 'hdd', '--medium', disk7] 
        v.customize ['storageattach', :id,  '--storagectl', 'SATA Controller', '--port', 3, '--device', 0, '--type', 'hdd', '--medium', disk8] 
      end
    end
  end
  # Server4.
  config.vm.define "server4" do |server4|
    server4.vm.box = "bento/centos-8.3"
    server4.vm.hostname = "server4.test"
    server4.vm.network :private_network, ip: "192.168.2.6"
 #   server4.vm.provision "shell",
 #     inline: "sudo yum update -y"
    server4.vm.provider :virtualbox do |v|
      v.customize ["modifyvm", :id, "--memory", 768]
      unless File.exist?(disk9)
        v.customize ['createhd', '--filename', disk9, '--variant', 'Standard', '--size', 256]
        v.customize ['createhd', '--filename', disk10, '--variant', 'Standard', '--size', 256]
        v.customize ['createhd', '--filename', disk11, '--variant', 'Standard', '--size', 256]
        v.customize ['storageattach', :id,  '--storagectl', 'SATA Controller', '--port', 2, '--device', 0, '--type', 'hdd', '--medium', disk9] 
        v.customize ['storageattach', :id,  '--storagectl', 'SATA Controller', '--port', 3, '--device', 0, '--type', 'hdd', '--medium', disk10] 
        v.customize ['storageattach', :id,  '--storagectl', 'SATA Controller', '--port', 4, '--device', 0, '--type', 'hdd', '--medium', disk11] 
      end
    end
  end
end
