# Update the repositories and Download/install the necessary prerequisites
execute "sudo apt-add-repository ppa:ondrej/php -y"
execute "sudo apt-get update"
['apache2', 'php', 'php-mbstring', 'php-zip', 'phpunit', 'unzip', 'libapache2-mod-php'].each do |p|
  package p do
    action :install
  end
end
#Download composer to install laravel 5.x PHP framework
execute "installComposer" do
  command "curl -Ss https://getcomposer.org/installer | php"
  user "vagrant"
  cwd "/tmp"
  environment 'HOME'  => '/home/vagrant'
end
# move composer to a location so everyone can use
execute "sudo mv /tmp/composer.phar /usr/bin/composer"
# install Laravel framework
execute "installLaravel" do
  command "composer global require laravel/installer"
  user "vagrant"
  environment 'HOME'  => '/home/vagrant'
end
# change ownership
execute "sudo chown -R vagrant:vagrant /var/www"
#use composer to create my myProject
execute "createProject" do
  command "composer create-project --prefer-dist laravel/laravel myProject"
  user "vagrant"
  cwd "/var/www"
  environment 'HOME'  => '/home/vagrant'
end
# change permission
execute "chmod -R 777 /var/www/myProject/storage"
# update apache2 DocumentRoot
execute "sudo sed -i 's/DocumentRoot.*/DocumentRoot \\/var\\/www\\/myProject\\/public/' /etc/apache2/sites-available/000-default.conf"
# update the MySQL DB information
execute "sed -i '/mysql/{n;n;n;n;s/'\\''DB_HOST'\\'', '\\''.*'\\''/'\\''DB_HOST'\\'', '\\''192.168.33.30'\\''/g}' /var/www/myProject/config/database.php"
execute "sed -i '/mysql/{n;n;n;n;s/'\\''DB_DATABASE'\\'', '\\''.*'\\''/'\\''DB_DATABASE'\\'', '\\''myproject'\\''/g}' /var/www/myProject/config/database.php"
execute "sed -i '/mysql/{n;n;n;n;n;s/'\\''DB_USERNAME'\\'', '\\''.*'\\''/'\\''DB_USERNAME'\\'', '\\''myproject'\\''/g}' /var/www/myProject/config/database.php"
execute "sed -i '/mysql/{n;n;n;n;n;n;s/'\\''DB_PASSWORD'\\'', '\\''.*'\\''/'\\''DB_PASSWORD'\\'', '\\''mypassword'\\''/g}' /var/www/myProject/config/database.php"
# Disable php5 modules.
execute "sudo a2dismod php5"
# Enable apache2 service and restart apache2 to reload the new configuration
service 'apache2' do
  supports :status => true, :restart => true, :reload => true
  action [ :enable, :restart]
end
