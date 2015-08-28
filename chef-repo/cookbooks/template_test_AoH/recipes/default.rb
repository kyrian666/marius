
class Chef::Recipe
  include Test
end

# Cookbook Name:: template_test_AoH
# Recipe:: default
#
# Copyright 2015, YOUR_COMPANY_NAME
#
# All rights reserved - Do Not Redistribute
#
	node.run_state[:test_list] = test_list

        node.run_state[:test_list].each do |mymicro|
            template "/tmp/ms-#{mymicro['api_name']}-balanced.conf" do
                source "microservices_balanced.conf.erb"
                owner "root"
                group "root"
                mode 0644
                variables ({
                    'api_name' => mymicro['api_name'], 
                    'api_uri' => mymicro['api_uri'],
                    'api_port_back' => mymicro['api_port_back'],
                    'api_hosts_back' => mymicro['api_hosts_back']
                })
            end
        end

#	log node.run_state[:test_list][0] do 
#            level :warn
#        end

#	p node.run_state[:test_list]

        template '/tmp/proxy.conf' do
            source "test.erb"
            owner "root"
            group "root"
            mode 0644
            variables(
		{ 'ms_list'=>node.run_state[:test_list] }
	    )
      end

