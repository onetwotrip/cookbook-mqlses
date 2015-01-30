#
# Cookbook Name:: cookbook-mqlses
# Recipe:: default
#
# Copyright 2015, Twiket Ltd
#
n = node['mqlses']

apt_repository 'elasticsearch' do
  uri "http://packages.elasticsearch.org/elasticsearch/#{n['es']['version']}/debian"
  components ['stable', 'main']
  key 'http://packages.elasticsearch.org/GPG-KEY-elasticsearch'
  notifies :run, 'execute[apt-get update]', :immediately
end

package 'elasticsearch'
service 'elasticsearch' do
  supports :start => true, :restart => true, :stop => true, :status => true
  action [:enable, :start]
end


n['elasticsearch']['plugins'].each_pair do |name, path|
  cookbook_mqlses_es_plugin name do
    path path
  end
end
