#
# Cookbook Name:: cookbook-mqlses
# Recipe:: genssl
#
# Copyright 2015, Twiket Ltd
#
n = node['mqlses']
gsd = n['gen_ssl_dir']
rmq_ssl_dir = '/etc/rabbitmq/ssl'

directory rmq_ssl_dir do
  mode 0755
  recursive true
end

directory gsd do
  mode 0755
end

template "#{gsd}/ssl_certs.sh" do
  source 'ssl_certs.sh.erb'
  mode 0755
  variables({
              :dir => gsd
            })
end

template "#{gsd}/openssl.cnf" do
  source 'gen_openssl.cnf.erb'
  variables({
              :dir => gsd
            })
end

bash 'generate_self_signed_ssl' do
  not_if { ::File.exists?("#{gsd}/server_cert.pem") }
  code <<-EOL
  cd #{gsd}
  #{gsd}/ssl_certs.sh generate &> /tmp/out
  cp #{gsd}/server_cert.pem #{rmq_ssl_dir}
  cp #{gsd}/server_key.pem #{rmq_ssl_dir}
  cp #{gsd}/cacert.pem #{rmq_ssl_dir}
  chown -R rabbitmq:rabbitmq #{rmq_ssl_dir}
  chmod 600 #{rmq_ssl_dir}/*.pem
  EOL
end
