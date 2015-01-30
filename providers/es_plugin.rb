use_inline_resources

def whyrun_supported?
  true
end

action :install do
  name = new_resource.name
  path = new_resource.path

  execute "install es plugin: #{name}" do
    ::Chef::Log.info "installing es plugin: #{name} from path: #{path}"
    command "/usr/share/elasticsearch/bin/plugin --install #{path}"
    not_if { ::File.exists?(::File.join('/usr/share/elasticsearch/plugins', name)) }
  end

end

action :uninstall do
  name = new_resource.name

  execute "uninstall es plugin: #{name}" do
    command "/usr/share/elasticsearch/bin/plugin --uninstall #{path}"
  end

end
