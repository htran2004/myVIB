
execute "sudo echo 'mysql-server mysql-server/root_password password admin' | debconf-set-selections"
execute  "sudo echo 'mysql-server mysql-server/root_password_again password admin' | debconf-set-selections"

package 'mysql-server'
service 'mysql' do
  supports :status => true, :restart => true, :reload => true
  action [:enable, :start]
end

execute "mysql -u root -padmin < /vagrant/createUser.sql"
