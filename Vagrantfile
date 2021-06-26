# -*- mode: ruby -*-
# vi: set ft=ruby :
disk1 = './disk-0-1.vdi'
disk2 = './disk-0-2.vdi'
disk3 = './disk-0-3.vdi'
disk4 = './disk-0-4.vdi'
Vagrant.configure("2") do |config|
  # Base VM OS configuration.
  config.ssh.insert_key = false
  config.vm.synced_folder '.', '/vagrant', disabled: true
  # General VirtualBox VM configuration.
  config.vm.provider :virtualbox do |v|
    v.memory = 1024
    v.cpus = 1
    #v.linked_clone = true
    v.customize ["modifyvm", :id, "--natdnshostresolver1", "on"]
    v.customize ["modifyvm", :id, "--ioapic", "on"]
  end
  config.vm.provider :libvirt do |libvirt|
    libvirt.cpus = 1
    libvirt.memory = 1024
  end
  # control.
  config.vm.define "control" do |control|
    control.vm.box = "m1k3bu11/CentOS8.3-Workstation"
    control.vm.hostname = "control.test"
    control.vm.network :private_network, ip: "192.168.2.2"
#    control.vm.provision "shell",
#      inline: "sudo yum update -y"
    control.vm.provider :virtualbox do |v|
      v.customize ["modifyvm", :id, "--memory", 2048]
      v.customize ["modifyvm", :id, "--cpus", 2]
      v.customize ["modifyvm", :id, "--vram", 12]
      v.customize ["modifyvm", :id, "--accelerate3d", "on"]
    end
    control.vm.provider :libvirt do |libvirt|
      libvirt.memory = 2048
      libvirt.cpus = 2
      libvirt.video_vram = 128
    end
  end
  # Server1.
  config.vm.define "iss1" do |server1|
    server1.vm.box = "m1k3bu11/CentOS8.3-Workstation"
    server1.vm.hostname = "iss1.test"
    server1.vm.network :private_network, ip: "192.168.2.3"
    server1.vm.provision "shell",
      inline: "sudo systemctl set-default multi-user.target"
    server1.vm.provision "shell",
      inline: "sudo reboot now"
    server1.vm.provider :virtualbox do |v|
      v.customize ["modifyvm", :id, "--memory", 768]
      v.customize ["modifyvm", :id, "--cpus", 1]
      v.customize ["modifyvm", :id, "--vram", 12]
      v.customize ["modifyvm", :id, "--accelerate3d", "off"]
      unless File.exist?(disk1)
        v.customize ['createhd', '--filename', disk1, '--variant', 'Fixed', '--size', 1024]
        v.customize ['storageattach', :id,  '--storagectl', 'SATA', '--port', 3, '--device', 0, '--type', 'hdd', '--medium', disk1] 
      end 
    end
    server1.vm.provider :libvirt do |libvirt|
      libvirt.memory = 768
      libvirt.cpus = 1
      libvirt.video_vram = 12
      libvirt.storage :file, :size => '1G', :bus => 'sata', :device => 'sdb'
    end
  end
  # Server2.
  config.vm.define "iss2" do |server2|
    server2.vm.box = "m1k3bu11/CentOS8.3-Workstation"
    server2.vm.hostname = "iss2.test"
    server2.vm.network :private_network, ip: "192.168.2.4"
 #   server2.vm.provision "shell",
 #     inline: "sudo yum update -y"
    server2.vm.provision "shell",
      inline: "sudo systemctl set-default multi-user.target"
    server2.vm.provision "shell",
      inline: "sudo reboot now"
    server2.vm.provider :virtualbox do |v|
      v.customize ["modifyvm", :id, "--memory", 768]
      v.customize ["modifyvm", :id, "--cpus", 1]
      v.customize ["modifyvm", :id, "--vram", 12]
      v.customize ["modifyvm", :id, "--accelerate3d", "off"]
    end
    server2.vm.provider :libvirt do |libvirt|
      libvirt.memory = 768
      libvirt.cpus = 1
      libvirt.video_vram = 12
    end

  end
  # Server3.
  config.vm.define "iss3" do |server3|
    server3.vm.box = "m1k3bu11/CentOS8.3-Workstation"
    server3.vm.hostname = "iss3.test"
    server3.vm.network :private_network, ip: "192.168.2.5"
 #   server3.vm.provision "shell",
 #     inline: "sudo yum update -y"
    server3.vm.provision "shell",
      inline: "sudo systemctl set-default multi-user.target"
    server3.vm.provision "shell",
      inline: "sudo reboot now"
    server3.vm.provider :virtualbox do |v|
      v.customize ["modifyvm", :id, "--memory", 768]
      v.customize ["modifyvm", :id, "--cpus", 1]
      v.customize ["modifyvm", :id, "--vram", 12]
      v.customize ["modifyvm", :id, "--accelerate3d", "off"]
      unless File.exist?(disk2)
        v.customize ['createhd', '--filename', disk2, '--variant', 'Fixed', '--size', 2048]
        v.customize ['storageattach', :id,  '--storagectl', 'SATA', '--port', 2, '--device', 0, '--type', 'hdd', '--medium', disk2] 
      end
    end
    server3.vm.provider :libvirt do |libvirt|
      libvirt.memory = 768
      libvirt.cpus = 1
      libvirt.video_vram = 12
      libvirt.storage :file, :size => '2G', :bus => 'sata', :device => 'sdb'
    end

  end
  # Server4.
  config.vm.define "iss4" do |server4|
    server4.vm.box = "m1k3bu11/CentOS8.3-Workstation"
    server4.vm.hostname = "iss4.test"
    server4.vm.network :private_network, ip: "192.168.2.6"
 #   server4.vm.provision "shell",
 #     inline: "sudo yum update -y"
    server4.vm.provision "shell",
      inline: "sudo systemctl set-default multi-user.target"
    server4.vm.provision "shell",
      inline: "sudo reboot now"
    server4.vm.provider :virtualbox do |v|
      v.customize ["modifyvm", :id, "--memory", 768]
      v.customize ["modifyvm", :id, "--cpus", 1]
      v.customize ["modifyvm", :id, "--vram", 12]
      v.customize ["modifyvm", :id, "--accelerate3d", "off"]
      unless File.exist?(disk3)
        v.customize ['createhd', '--filename', disk3, '--variant', 'Fixed', '--size', 2048]
        v.customize ['storageattach', :id,  '--storagectl', 'SATA', '--port', 2, '--device', 0, '--type', 'hdd', '--medium', disk3] 
      end
    end 
    server4.vm.provider :libvirt do |libvirt|
      libvirt.memory = 768
      libvirt.cpus = 1
      libvirt.video_vram = 12
      libvirt.storage :file, :size => '1G', :bus => 'sata', :device => 'sdb'
    end
  end
  config.vm.define "iss5" do |server5|
    server5.vm.box = "m1k3bu11/CentOS8.3-Workstation"
    server5.vm.hostname = "iss5.test"
    server5.vm.network :private_network, ip: "192.168.2.7"
 #   server4.vm.provision "shell",
 #     inline: "sudo yum update -y"
    server5.vm.synced_folder ".", "/vagrant", type: "rsync", rsync__exclude: [".git/", "disk-0-1.vdi", "disk-0-2.vdi", "disk-0-3.vdi", "disk-0-4.vdi"]
    server5.vm.provision "shell",
      inline: "sudo systemctl set-default multi-user.target"
    server5.vm.provision "shell",
      inline: "sudo cp /vagrant/ansible.cfg /etc/ansible/ansible.cfg"
    server5.vm.provision "shell",
      inline: "bash /vagrant/provision.sh"
    server5.vm.provision "shell",
      inline: "sudo reboot now"
    server5.vm.provider :virtualbox do |v|
      v.customize ["modifyvm", :id, "--memory", 768]
      v.customize ["modifyvm", :id, "--cpus", 1]
      v.customize ["modifyvm", :id, "--vram", 12]
      v.customize ["modifyvm", :id, "--accelerate3d", "off"]
      unless File.exist?(disk4)
        v.customize ['createhd', '--filename', disk4, '--variant', 'Fixed', '--size', 1024]
        v.customize ['storageattach', :id,  '--storagectl', 'SATA', '--port', 2, '--device', 0, '--type', 'hdd', '--medium', disk4] 
      end
    end
    server5.vm.provider :libvirt do |libvirt|
      libvirt.memory = 768
      libvirt.cpus = 1
      libvirt.video_vram = 12
      libvirt.storage :file, :size => '1G', :bus => 'sata', :device => 'sdb'
    end
  end
end
