Vagrant.configure("2") do |config|
  config.vm.box = "generic/ubuntu2204"
  
  config.vm.define "ubuntu_vsc_nodejs" do |ubuntu_vsc_nodejs|
    
    config.vm.synced_folder "V:\\vagrant-steffen\\shared", "/mnt/mysharedfolder", automount: true
    
    config.vm.provider "virtualbox" do |vb|
        vb.name = "Ubuntu Desktop, Visual Studio Code and Node.js"
        vb.memory = "12288"
        vb.cpus = "6"
        vb.customize ['modifyvm', :id, '--graphicscontroller', 'vmsvga']
        vb.customize ['modifyvm', :id, '--vram', '128']
        vb.customize ["modifyvm", :id, "--clipboard-mode", "bidirectional"]
        vb.customize ["modifyvm", :id, "--draganddrop", "bidirectional"]
        vb.gui = true
        
    args = []
    config.vm.provision "ubuntu_etc shell script", type: "shell",
        path: "scripts/ubuntu_etc.sh",
        args: args
    end
    
  end

end