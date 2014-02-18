#
# Cookbook Name:: install_packages
# Recipe:: default
#
# Copyright 2014, YOUR_COMPANY_NAME
#
# All rights reserved - Do Not Redistribute
#

include_recipe "tomcat::default"
inlcude_recipe "maven"

execute 'apt-get update'
cookbook_file "/etc/motd" do
  action :create
end
