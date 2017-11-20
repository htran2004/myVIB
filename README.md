# myVIB Monday, 20 November 2017
There is a well known PHP's Framework For WEB Artisans out there in the internet called Laravel 5.x. It's already have it's own prebuilt Vagrant box that contains the application with all the prerequisites called Laravel Homestead (https://app.vagrantup.com/laravel/boxes/homestead)


For the purpose of this demos we are going to use Vagrant to deploy an LAMP (Linux, Apache, MySqL, and PHP) along with Laravel 5.x PHP Framework. I will spin-up two Vagrant boxes as the following;

1. Web/App server

	Host name: APP1

	Components: Ubuntu/trusty64, Apache2, PHP 7 (and some required PHP extensions) and Laravel 5.x

2. DB server

	Host name: DB1

	Components: Ubuntu/trusty64, mySQL


	Directory structure

	<myVIB>
				[]
				--------createUser.sql
				[]
				--------Vagrantfile
				[]
				--------README.md
				[]
				--------<cookbooks>----<app>----<recipes>---default.rb
				[]
				-----<db>----<recipes>---default.rb


	Note that I am using chef_solo to do the configure management and Laravel composer installer to install/configure Laravel.

	To access the front pages: http://192.168.33.20
