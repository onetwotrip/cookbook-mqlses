default['mqlses']['logstash']['version'] = '1.4'
default['mqlses']['es']['version'] = '1.4'
default['mqlses']['gen_ssl']['enable'] = true
default['mqlses']['kibana']['enable'] = true
default['mqlses']['gen_ssl_dir'] = '/etc/gen_ssl_dir'
default['mqlses']['user'] = 'logstash'
default['mqlses']['password'] = 'logstash1'

default['java']['install_flavor'] = 'oracle'
default['java']['jdk_version'] = '8'
default['java']['oracle']['accept_oracle_download_terms'] = true

default['rabbitmq']['use_distro_version'] = true
default['rabbitmq']['cluster'] = true

default['rabbitmq']['ssl']                      = true
default['rabbitmq']['ssl_verify']               = 'verify_none'
default['rabbitmq']['ssl_cacert']               = '/etc/gen_ssl_dir/cacert.pem'
default['rabbitmq']['ssl_cert']                 = '/etc/gen_ssl_dir/server_cert.pem'
default['rabbitmq']['ssl_key']                  = '/etc/gen_ssl_dir/server_key.pem'
default['rabbitmq']['ssl_fail_if_no_peer_cert'] = false
default['rabbitmq']['web_console_ssl']          = true
default['rabbitmq']['web_console_ssl_port']     = 15_671
default['rabbitmq']['enabled_plugins'] = ['rabbitmq_management']
default['rabbitmq']['enabled_users'] = ['guest']


default['kibana_authentication_proxy']['ssl']['enable'] = true
default['kibana_authentication_proxy']['ssl']['key_file_path'] = '/etc/gen_ssl_dir/server_key.pem'
default['kibana_authentication_proxy']['ssl']['cert_file_path'] = '/etc/gen_ssl_dir/server_cert.pem'
default['kibana_authentication_proxy']['kibana_dashboards']['elasticsearch_index'] = 'kibana-int-%user%'
default['kibana_authentication_proxy']['kibana_dashboards']['auth_type'] = 'basic'
default['kibana_authentication_proxy']['basic_auth']['enable'] = true
default['kibana_authentication_proxy']['basic_auth']['users'] = [{user:"guest",password:"guest"},{user:"guest2",password:"guest2"}]
