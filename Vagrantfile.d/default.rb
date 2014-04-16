# Vagrantfile.d/default.rb
# vi: set sw=2 ts=2 sts=2 ft=ruby :
#
# This file is loaded when and only when
# Vagrantfile.d/USERNAME.rb is not found.

Vagrant.configure(VAGRANTFILE_API_VERSION) do |config|
  config.vm.network "forwarded_port", guest: 8088, host: 12080
  config.vm.network "forwarded_port", guest: 443,  host: 12443
  # config.vm.synced_folder "/home/user/git/dcp", "/opt/meetings/dcp" # example
end
