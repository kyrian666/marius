directory '/tmp/messages' do
#  owner 'root'
#  group 'root'
  mode '0755'
  action :create
end

file '/tmp/messages/motd' do
  content 'hello dear. motd b0rk b0rk b0rk chef! REGULAR ORDINARY SWEDISH MEAL TIME'
end

