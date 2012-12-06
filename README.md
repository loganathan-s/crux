Spree
====

Spree is a complete open source commerce solution for Ruby on Rails. It was originally developed by Sean Schofield and is now maintained by a dedicated core team. You can find out more about by visiting the Spree e-commerce project page.

Spree actually consists of several different gems, each of which are maintained in a single repository and documented in a single set of online documentation. By requiring the Spree gem you automatically require all of the necessary dependency gems. Those gems are as follows:

spree_api
spree_auth
spree_core
spree_dash
spree_promo
spree_sample

All of the gems are designed to work together to provide a fully functional e-commerce platform. It is also possible, however, to use only the pieces you are interested in. So for example, you could use just the 
barebones spree_core gem and perhaps combine it with your own custom authorization scheme 
instead of using spree_auth.


Installation Steps:
====

Pre requisites:
 1. Rails 3.0.10
 2. Ruby 1.9.3
 3. Apache Server
 4. Passenger Module for Apache
 5. Mysql


Clone the git repo   

git clone git://github.com/spree/spree.git

cd spree

git tag -l v0.60.4


Install the gem dependencies

bundle install

Create a sandbox rails application for testing purposes (and automatically perform all necessary database setup)

bundle exec rake sandbox

cd sandbox

Install the gem dependencies supported for sandbox

bundle install

Now you just need to create new database

bundle exec rake db:create

Then use the install generator to do the basic setup (Copies all migrations and assets)

bundle exec rake spree:install

Now you just need to run the new migrations, and setup some basic data

bundle exec rake db:migrate

bundle exec rake db:seed

Now just loads sample data into the store

bundle exec rake db:sample

Crux
====

Crux is the extension of spree CMS. It is mandatory that Spree has to be installed in the system. Crux enables separate On-Line store will be created for paid registered users. Three kind of users with roles named as Super-Admin, Admin, and Normal User. 
Super Admin is the one who has ability to manage the domain. 
Store owners can register And start their own store. Each store will operate as a unique business and will have a custom domain name and branding. Store owner can act as admin for his domain and he can set his
Personalised configurations for his shop.

Clone the crux gem in your spree directory:

cd spree

git clone https://github.com/loganathan-s/crux.git

cd sandbox

Add to the following gem dependency in sandbox/Gemfile

gem "crux" ,:path => "../crux"

gem 'subdomain-fu', '1.0.0.beta2', :git => "git://github.com/nhowell/subdomain-fu.git"

gem 'dynamic_form'

gem 'geokit'

Run

bundle install

bundle exec rake spree_core:install

bundle exec rake crux:install

bundle exec rake db:migrate


Add File called settings.yml to sandbox/config directory

For instance:
====

development/production:

domain_url: http://yourdomain.com (eg:http://shop.storefront.com)

secure_domain_url: https://yourdomain.com (eg:https://shop.storefront.com)

sub_domain: yoursubdomain (eg:shop)

separate_url: yourdomain (eg:shop.storefront)

Sample Settings.yml file:

development:

 domain_url: http://www.storefront.com
 
 secure_domain_url: https://shop.storefront.com
 
 sub_domain: shop
 
 separate_url: shop.storefront

test:

 domain_url: http://www.storefront.com
 
 secure_domain_url: https://shop.storefront.com
 
 sub_domain: shop
 
 separate_url: shop.storefront
 

production:

 domain_url: http://www.storefront.com
 
 secure_domain_url: https://shop.storefront.com
 
 sub_domain: shop
 
 separate_url: shop.storefront


Note:
====

Before register any store, the store registration payment method  should be updated in admin/configuration panel by super admin. Then only the store can be registered.
URL for Superadmin domainname/login

DNS Subdomain Configuration

At intial, update your store's Mail method.

Before Running the application, configure the host settings:

Sample Virtualhostfile(For dev environment):


  <VirtualHost *:80>
  
      ServerName www.storefront.com
      
      ServerAlias *.storefront.com
      
      RailsEnv development
      
      DocumentRoot /var/www/rails/spree/sandbox/public    
      
      <Directory /var/www/rails/spree/sandbox/public>
      
         # This relaxes Apache security settings.
         AllowOverride None
	 
         # MultiViews must be turned off.
	 
         Options -MultiViews
	 
      </Directory>
      
   </VirtualHost>
