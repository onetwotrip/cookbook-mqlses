#
# Cookbook Name:: cookbook-mqlses
# Recipe:: nginx-ssl-proxy
#
# Copyright 2015, Twiket Ltd
#
n = node['mqlses']

include_recipe 'nginx'
include_recipe 'htpasswd'

service 'nginx' do
  action :nothing
end

template '/etc/nginx/sites-available/nginx-ssl-proxy' do
  source 'nginx-ssl-proxy.erb'
  variables({
              :ssl_key => n['nginx-ssl-proxy']['ssl_key'],
              :ssl_cert => n['nginx-ssl-proxy']['ssl_cert']
            })
end

nginx_site 'nginx-ssl-proxy' do
  enable true
end

nginx_site 'default' do
  enable false
end

n['nginx-ssl-proxy']['users'].each_pair do |user, password|
  htpasswd n['nginx-ssl-proxy']['htpasswd_file'] do
    user user
    password password
  end
end
