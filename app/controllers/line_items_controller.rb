class LineItemsController < ApplicationController
	
	def create
		@cart = current_user.create_current_cart if @cart.nil? || @cart.submitted?
		line_item = @cart.add_item(params[:item_id])
		if line_item.save
			redirect_to cart_path(@cart), {notice: 'Item added to cart!'}
		else
			redirect_to store_path, {notice: 'Unable to add item'}
		end
	end
	
	
end
