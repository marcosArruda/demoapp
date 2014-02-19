include_recipe 'application_java'

application 'demoapp' do
  path         '/usr/local/demoapp'
  owner        node['tomcat']['user']
  group        node['tomcat']['group']
  repository   'http://mirrors.jenkins-ci.org/war/latest/jenkins.war'
  revision     '6facd94e958ecf68ffd28be371b5efcb5584c885b5f32a906e477f5f62bdb518-1'
    scm_provider Chef::Provider::RemoteFile::Deploy

  java_webapp do
    context_template 'demoapp-context.xml.erb'
  end

  tomcat
end


