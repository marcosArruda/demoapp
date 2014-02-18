name             'install_packages'
maintainer       'Summa'
maintainer_email 'marcos.arruda@summa.com.br'
license          'All rights reserved'
description      'Installs/Configures install_packages'
long_description IO.read(File.join(File.dirname(__FILE__), 'README.md'))
version          '0.1.0'

%w{ apt tomcat maven }.each do |cb|
  depends cb
end

%w{ debian ubuntu centos redhat fedora amazon }.each do |os|
  supports os
end

recipe 'install_packages::default', 'install tomcat and others packages configured for toolcloud'
