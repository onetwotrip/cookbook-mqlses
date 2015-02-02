#
# Cookbook Name:: cookbook-mqlses
# Recipe:: default
#
# Copyright 2015, Twiket Ltd
#
include_recipe 'runit'
include_recipe 'kibana-authentication-proxy'

runit_service "kibana-authentication-proxy" do
  run_template_name 'kibana-authentication-proxy'
  restart_on_update true
end
