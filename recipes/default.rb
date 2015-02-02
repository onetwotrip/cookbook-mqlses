#
# Cookbook Name:: cookbook-mqlses
# Recipe:: default
#
# Copyright 2015, Twiket Ltd
#
include_recipe 'apt'
include_recipe 'java'

include_recipe 'cookbook-mqlses::logstash'
include_recipe 'cookbook-mqlses::elasticsearch'

n = node['mqlses']

include_recipe 'rabbitmq'
include_recipe 'rabbitmq::mgmt_console'

rabbitmq_user n['user'] do
  password n['password']
  vhost "/"
  permissions ".* .* .*"
  action [:add, :set_permissions]
end


if n['gen_ssl']['enable']
  include_recipe 'cookbook-mqlses::genssl'
end

if n['kibana']['enable']
  include_recipe 'cookbook-mqlses::kibana-authentication-proxy'
end

if n['nginx-ssl-proxy']['enable']
  include_recipe 'cookbook-mqlses::nginx-ssl-proxy'
end
