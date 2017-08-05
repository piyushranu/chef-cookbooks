Cookbook Name:: linux_basic
Recipe:: default
execute 'apt' do
	command 'apt update'
	action :run
end
