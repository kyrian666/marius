package 'openssh-server'

service 'ssh' do
   supports :status => true
   action [:enable, :start]
end
