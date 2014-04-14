# Vagrant configuration for Meetin.gs local development environment
# 2014-04-14 / Meetin.gs

VAGRANTFILE_API_VERSION = "2"

if File.exists?("Vagrantfile.d/#{ENV['USER']}.rb")
  load "Vagrantfile.d/#{ENV['USER']}.rb"
elsif File.exists?("Vagrantfile.d/default.rb")
  load "Vagrantfile.d/default.rb"
end

Vagrant.configure(VAGRANTFILE_API_VERSION) do |config|
  ### Machine settings
  #
  config.vm.hostname = "localdev"
  config.vm.box      = "localdev32"
  config.vm.box_url  = "http://ubuntu.meetin.gs/localdev.box"

  ### Provisioning
  #
  config.vm.provision :shell, path: "shell/stdintty.sh"

  config.vm.provision :puppet, :options => "--verbose" do |puppet|
    puppet.module_path    = "puppetmaster/modules"
    puppet.manifests_path = "puppetmaster/manifests"
    puppet.manifest_file  = "localdev.pp"
  end

  config.vm.provision :puppet, :options => "--verbose" do |puppet|
    puppet.module_path    = "puppetmaster/modules"
    puppet.manifests_path = "puppetmaster/manifests"
    puppet.manifest_file  = "localdev.pp"
  end

  config.vm.provision :shell, path: "shell/mogilefs.sh"
  config.vm.provision :shell, path: "shell/autodeploy.sh"
  config.vm.provision :shell, path: "shell/coreinit.sh"

  ### Virtalbox configuration
  #
  config.vm.provider :virtualbox do |virtualbox|
    virtualbox.name   = "mtngs-localdev"
    virtualbox.memory = "2048"
  end
end

# vi: set sw=2 ts=2 sts=2 ft=ruby :
