class ProductsController < ApplicationController
  
  
  # GET /products
  def index
    @products = Product.all

  end

  # GET /products/1
  def show
    @product = Product.find(params[:id])
    @stats = {}
    @stats[:count] = @product.bugs.count
    @stats[:severities] = {}
    Bug::SEVERITIES.each do |s|
      @stats[:severities][s[0]] = { :count => @product.bugs.where(:severity => s[1]).count }
      Bug::STATUSES.each do |s2|
	
        @stats[:severities][s[0]][s2[0]] = { :count => @product.bugs.where(:severity => s[1], :status => s2[1]).count }
      end
    end
    @stats[:statuses] = {}
    Bug::STATUSES.each do |s|
      @stats[:statuses][s[0]] = { :count => @product.bugs.where(:status => s[1]).count }
    end
  end

end
