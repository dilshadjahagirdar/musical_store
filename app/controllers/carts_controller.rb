class CartsController < ApplicationController
	skip_before_action :verify_authenticity_token  

	def index
		@cart = Cart.all
		render 'index', formats: [:json], handlers: [:jbuilder], status: 200
	end
	def create
		@cart = Cart.where(:item_id => params["id"])

		if @cart.length > 0
			@cart.first.quantity = @cart.first.quantity + 1
			@cart.first.item_total = @cart.first.item_total + params["price"].to_i
			@cart.first.save
		else
			@cart = Cart.new
			@cart.item_id = params["id"]
			@cart.quantity = 1
			@cart.item_total = params["price"]
			@cart.save
		end
		render :json => {:message => "success", :redirect_to => "/index.html"}, status: 200				
	end

end
