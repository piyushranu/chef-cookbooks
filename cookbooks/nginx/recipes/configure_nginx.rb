service "nginx" do
  supports restart: true, status: true
  action :nothing
end

cookbook_file '/etc/nginx/nginx.conf' do
  source 'nginx/nginx.conf'
  owner 'root'
  group 'root'
  mode '0755'
  notifies :restart, 'service[nginx]', :delayed
end

template '/etc/nginx/conf.d/apiserver.conf' do
  source 'nginx/nginx.conf.erb'
  owner 'root'
  group 'root'
  mode '0755'
  notifies :restart, 'service[nginx]', :delayed
end

bash "rm_default_nginx" do
  code <<-EOH
    rm -f /etc/nginx/sites-enabled/default
  EOH
  only_if { ::File.exists?("/etc/nginx/sites-enabled/default") }
  notifies :restart, 'service[nginx]', :delayed
end

