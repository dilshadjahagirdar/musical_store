
json.array!(@cart) do |cart| 
	json.cart_id cart.id
	json.item_id cart.item_id
	json.quantity cart.quantity
	json.item_total cart.item_total
	@product = Product.where(:id => cart.item_id).first if cart.item_id
	if @product
		json.product_name @product.name
		json.product_brand @product.brand
		json.product_model @product.model
		json.product_price @product.price
	end
	

end