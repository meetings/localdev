# Vagrantfile.d/amv.rb

Vagrant.configure(VAGRANTFILE_API_VERSION) do |config|
    config.vm.network "forwarded_port", guest: 8088, host: 12080
    config.vm.network "forwarded_port", guest: 443,  host: 12443
    config.vm.synced_folder "/Users/amv/git/dcp", "/opt/meetings/dcp"
    config.vm.synced_folder "/Users/amv/git/data-api-node", "/opt/meetings/data-api"
end
