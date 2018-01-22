Vagrant.configure("2") do |config|

	config.vm.define "db" do |db|
        db.vm.box = "ubuntu/trusty64"
        db.vm.synced_folder "db/", "/srv"
        db.vm.synced_folder "config/", "/config"
        db.vm.hostname = "db"
        db.vm.network "private_network", ip: "10.1.1.2"
        db.vm.provision :shell, path: "provision-db.sh"
    end

end