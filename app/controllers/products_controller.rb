class ProductsController < ApplicationController
	skip_before_action :verify_authenticity_token  
	def index
		@products = Product.all
		render :json => {:products => @products}, status: 200
	end

	def create
		@product = Product.new(product_params)
		if @product.save
			render :json => {:message => "success", :redirect_to => "/index.html"}, status: 200
		else
			render :json => {:products => "Failed"}, status: 500
		end				
	end

	def product_params
	    params.require(:product).permit( :name, :brand, :model, :price)
	end
end
