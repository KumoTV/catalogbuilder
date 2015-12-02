require 'yaml'
containers = YAML.load_file(File.expand_path('./containers.yml'))

VAGRANT_API_VERSION = "2"

Vagrant.configure(VAGRANT_API_VERSION) do |config|

  # VM Config
  config.vm.box = "ubuntu/trusty64"
  config.vm.define "catalogbuilder-dev" do |ubuntu|
    config.vm.provider :virtualbox do |vb|
      vb.name = "catalogbuilder-dev"
      vb.memory = "2048"
    end
  end

  config.vm.provision :docker do |d|
    containers.each do |c|
      d.run c['name'], image: c['image'], args: c['exports']
    end
  end

  config.vm.box_check_update = false
  config.vm.network "forwarded_port", guest: 3000, host: 8080
  config.vm.network "public_network"
  # config.vm.synced_folder "../data", "/vagrant_data"
end
