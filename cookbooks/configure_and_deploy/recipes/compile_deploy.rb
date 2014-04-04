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
