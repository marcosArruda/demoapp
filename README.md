Exemplo de uso do Chef com Vagrant
========

Aplicação exemplificando o uso das ferramentas Chef e Vagrant para automatizar um ambiente de desenvolvimento com Tomcat, e mostrar como eh possivel automatizar essa parte do processo de Deploy Contínuo.

Veja um screencast desse exemplo: https://www.youtube.com/watch?v=y8JQLla8jh0

Como Usar?
========

* Baixe e instale o Vagrant: http://www.vagrantup.com/downloads.html
* Instale os plugins do Vagrant:
```
    vagrant plugin install vagrant-omnibus
    vagrant plugin install vagrant-aws
```

* Baixe e instale o VirtualBox: https://www.virtualbox.org/wiki/Downloads

* Clone esse repositorio
```
    git clone https://github.com/marcosArruda/demoapp.git
```

* Copie o arquivo vagrant_config_template.yml para vagrant_config.yml

* Se quiser executar localmente na sua propria máquina:
```
    vagrant up
```
* Caso prefira executar em uma maquina virtual na Amazon AWS, coloque suas chaves da Amazon no arquivo vagrant_config.yml
```
    vagrant up --provider=aws
```
