Vagrant.configure(2) do |config|

  config.vm.box = "ubuntu/xenial64"

  config.vm.provider "virtualbox" do |vb|
    # 1024MB * 12
    vb.memory = "12288"
    vb.cpus = 4
  end

  config.vm.provision :shell, path: "bootstrap.sh", privileged: false

end
