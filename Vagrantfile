require 'yaml'

CONF = YAML::load_file("vagrant_config.yml")

Vagrant.configure("2") do |config|
  config.vm.hostname = "summa-demo-machine"
  config.vm.box = CONF['vm_box']
  config.vm.box_url = CONF['vm_box_url']
  config.omnibus.chef_version = :latest
  config.vm.provision "chef_solo", run_list: ["configure_and_deploy::configure", "configure_and_deploy::compile_deploy", "motd"]
  config.vm.provider :aws do |aws, override|
    aws.access_key_id = CONF['aws_access_key_id']
    aws.secret_access_key = CONF['aws_secret_access_key']
    aws.keypair_name = CONF['aws_keypair_name']
    aws.security_groups = CONF['aws_security_groups']
    aws.ami = CONF['aws_ami']
    aws.instance_type = "m1.small"                      
    aws.region = "us-east-1"
    override.ssh.username = "ubuntu"
    override.ssh.private_key_path = CONF['ssh_private_key_path']
  end
end
