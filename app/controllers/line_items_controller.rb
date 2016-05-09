class LineItemsController < ApplicationController
	
	def create
		@cart = current_user.carts.create if @cart.nil?
		@cart.add_item(params[:item_id])
		redirect_to cart_path(@cart)
	end
	
	
end
