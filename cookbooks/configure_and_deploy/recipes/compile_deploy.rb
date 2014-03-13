#include_recipe 'application'

#execute 'mvn -f /vagrant/pom.xml clean install'

#application 'demoapp' do
  #path         '/vagrant'
  #owner        node['tomcat']['user']
  #group        node['tomcat']['group']
  #source	'/vagrant/target/demoapp.war'
  #repository	'/vagrant/target/demoapp.war'
  #repository   'http://mirrors.jenkins-ci.org/war/latest/jenkins.war'
  #revision     '6facd94e958ecf68ffd28be371b5efcb5584c885b5f32a906e477f5f62bdb518-1'
    #scm_provider Chef::Provider::RemoteFile::Deploy

  #java_webapp do
    #context_template 'demoapp-context.xml.erb'
  #end

  #tomcat
#end

service "tomcat" do
  service_name "tomcat6"
  supports :restart => true, :reload => false, :status => true
  action [:enable, :stop]
  retries 4
  retry_delay 20
end

bash "compileproject_and_deploy" do
  user "root"
  cwd "/vagrant"
  code <<-EOH
  mvn -f /vagrant/pom.xml clean install
  cp /vagrant/target/demoapp.war /var/lib/tomcat6/webapps/
  EOH
end

service "tomcat" do
  service_name "tomcat6"
  supports :restart => true, :reload => false, :status => true
  action [:enable, :start]
  retries 4
  retry_delay 20
end

#execute 'wget "http://deploy:mfa123@localhost:8080/manager/deploy?path=/demoapp&war=file:/vagrant/target/demoapp.war" -O - -q'
