require 'yaml'

CONF = YAML::load_file("vagrant_config.yml")

Vagrant.configure("2") do |config|
  config.vm.hostname = "summa-demo-machine"
  config.vm.box = "demoapp"
  config.vm.box_url = "http://files.vagrantup.com/precise64.box" 

  # Configuracoes do Chef
  # Omnibus vai instalar o Chef na sua maquina Vagrant automaticamente
  config.omnibus.chef_version = :latest
  # E o chef-solo sera usado para instalar os cookbooks listados
  config.vm.provision "chef_solo", run_list: ["configure_and_deploy::configure", "configure_and_deploy::compile_deploy", "motd"]

  # Essa configuracao de rede sera ignorada no caso do provider AWS
  config.vm.network "forwarded_port", guest: 8080, host: 8080

  # Configuracoes para usar o Amazon Web Services (veja arquivo vagrant_config.yml)
  config.vm.provider :aws do |aws, override|
    aws.access_key_id = CONF['aws_access_key_id']
    aws.secret_access_key = CONF['aws_secret_access_key']
    aws.keypair_name = CONF['aws_keypair_name']
    aws.security_groups = CONF['aws_security_groups']
    aws.ami = CONF['aws_ami']
    aws.instance_type = CONF['aws.instance_type']                      
    aws.region = CONF['aws.region']
    override.ssh.username = CONF['default_username']
    override.ssh.private_key_path = CONF['ssh_private_key_path']
  end
end
