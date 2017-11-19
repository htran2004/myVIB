# myVIB Monday, November 2017
There is a well known PHP's Framework For WEB Artisans out there in the internet called Laravel 5.x. It's already have it's own prebuilt Vagrant box that contains the application with all the prerequisites called Laravel Homestead. For the purpose of this demos we are going to use Vagrant to deploy an LAMP (Linux, Apache, MySqL, and PHP) along with Laravel 5.x PHP Framework. i will spin-up two Vagrant boxes as the following;

1. Web/App server
	host name: APP1
	component: Ubuntu/trusty64, Apache2, PHP 7 (and some required PHP extensions) and Laravel 5.x

2. DB server 
	host name: DB1
	Components: Ubuntu/trusty64, mySQL
