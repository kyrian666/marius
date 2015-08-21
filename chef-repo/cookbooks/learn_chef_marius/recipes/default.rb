#
# Cookbook Name:: learn_chef_marius
# Recipe:: default
#
# Copyright (c) 2015 The Authors, All Rights Reserved.
# This should be conditional on OS being linux at very least!

package 'openssh-server'

service 'ssh' do
   supports :status => true
   action [:enable, :start]
end

file '/home/keving/test.txt' do
   source 'index.txt.erb'
end
