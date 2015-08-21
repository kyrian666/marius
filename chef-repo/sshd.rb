# This should be conditional on OS being linux at very least!

package 'openssh-server'

service 'ssh' do
   supports :status => true
   action [:enable, :start]
end

file '/home/keving/test.txt' do
   content 'This is
a multi
line
test
of
chef
b0rk
b0rk
ping!
'
end
