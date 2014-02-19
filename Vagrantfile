require 'yaml'

CONF = YAML::load_file("/home/" + ENV['USER'] + "/vagrant_config.yml")

Vagrant.configure("2") do |config|
  config.vm.hostname = "toolscloud-demo-machine"
  config.vm.box = CONF['config']['vm_box']
  config.vm.box_url = CONF['config']['vm_box_url']
  config.omnibus.chef_version = :latest
  config.vm.provision "chef_solo", run_list: ["install_packages::default"]
  config.vm.provider :aws do |aws, override|
    aws.access_key_id = CONF['config']['aws_access_key_id']
    aws.secret_access_key = CONF['config']['aws_secret_access_key']
    aws.keypair_name = CONF['config']['aws_keypair_name']
    aws.security_groups = [ CONF['config']['aws_security_groups'] ]
    aws.ami = CONF['config']['aws_ami']
    aws.instance_type = "m1.small"                      
    aws.region = "us-east-1"
    override.ssh.username = "user"
    override.ssh.private_key_path = CONF['config']['ssh_private_key_path']
  end
end
