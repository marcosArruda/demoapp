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

apt_package "name" do
  attribute "value" # see attributes section below
  ...
  action :action # see actions section below
end

#execute 'wget "http://<user>:<pass>@<host>:<port>/manager/deploy?path=/<context>&war=file:<filepath>" -O - -q'


cookbook_file "/etc/motd" do
  action :create
end