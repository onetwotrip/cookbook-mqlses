#
# Cookbook Name:: cookbook-mqlses
# Recipe:: default
#
# Copyright 2015, Twiket Ltd
#
n = node['mqlses']

apt_repository 'logstash' do
  uri "http://packages.elasticsearch.org/logstash/#{n['logstash']['version']}/debian"
  components ['stable', 'main']
  key 'http://packages.elasticsearch.org/GPG-KEY-elasticsearch'
  notifies :run, 'execute[apt-get update]', :immediately
end

package 'logstash'

template "/etc/logstash/conf.d/01-mqlses.conf" do
  source "01-mqlses.conf.erb"
  variables({
              :user => n['user'],
              :password => n['password'],
            })
  notifies :restart, 'service[logstash]', :delayed
end

service 'logstash' do
  supports :start => true, :restart => true, :stop => true, :status => true
  action [:enable, :start]
end
