class Spree::HomeController < Spree::BaseController
   #require 'will_paginate/array'
    helper 'spree/products'
		helper :all
   respond_to :html
   include Spree::Admin::BaseHelper
   layout :choose_layout
   def index
    p @searcher = Spree::Config.searcher_class.new(params)
    p "22222222222222222222222222222222222222________________"
    p domain = get_sub_domain(current_subdomain)
     myarray= @searcher.retrieve_products(domain)
		 	p=Spree::Product.find(:all,:conditions=>["domain_url=?",get_sub_domain(current_subdomain)],:order=>"id desc",:limit=>10).map(&:id)
	   #@products=@products.reject{|x| p.include?(x.id)}
      respond_with(@products= Kaminari.paginate_array(myarray).page(params[:page]).per(6))
   end

   def choose_layout
      if (request.url.include?(APP_CONFIG['domain_url']) || request.url.include?(APP_CONFIG['secure_domain_url']))
         return "/spree/layouts/saas"
      else
         return "/spree/layouts/spree_application"
      end
   end

end