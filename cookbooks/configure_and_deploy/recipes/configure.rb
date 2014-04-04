#
# Cookbook Name:: configure_and_deploy
# Recipe:: configure
#
# Copyright 2014, YOUR_COMPANY_NAME
#
# All rights reserved - Do Not Redistribute
#

include_recipe 'apt'
include_recipe "maven"
include_recipe "tomcat::default"
include_recipe "tomcat::users"
execute 'apt-get update'
