#
# Cookbook Name:: nginx
# Recipe:: default
#
# Copyright 2013, YOUR_COMPANY_NAME
#
# All rights reserved - Do Not Redistribute
#

cache_path = Chef::Config[:file_cache_path]

if platform?("centos")
  major_version = node['platform_version'].to_i
  repository_rpm = "nginx-release-centos-#{major_version}-0.el#{major_version}.ngx.noarch.rpm"

  remote_file "#{cache_path}/#{repository_rpm}" do
    source "http://nginx.org/packages/centos/#{major_version}/noarch/RPMS/#{repository_rpm}"
    checksum '9e0a151f34e193d34e3e90e7d30255459ad0ccad'
  end

  package 'nginx repository' do
    action :install
    source "#{cache_path}/#{repository_rpm}"
  end

  package 'nginx' do
    action :install
  end
end
