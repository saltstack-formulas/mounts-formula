VAGRANTFILE_API_VERSION = "2"
Vagrant.configure(VAGRANTFILE_API_VERSION) do |config|
  config.vm.provider "virtualbox" do |vb|
     vb.customize ["createhd", "--filename", "disk1.vdi", "--size", "10240"]
     vb.customize ["createhd", "--filename", "disk2.vdi", "--size", "10240"]
     vb.customize ["storageattach", :id, "--storagectl", "SATA Controller", "--port", "1", "--device", "0", "--type", "hdd", "--medium", "disk1.vdi"]
     vb.customize ["storageattach", :id, "--storagectl", "SATA Controller", "--port", "2", "--device", "0", "--type", "hdd", "--medium", "disk2.vdi"]
  end
end
