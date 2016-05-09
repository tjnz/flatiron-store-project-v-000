class CartsController < ApplicationController
	before_filter :authenticate_user!

	def show
		@cart = Cart.find(params[:id])
		render 'show', locals: {current_cart: @cart}
	end
	
	def checkout
		current_user.current_cart.checkout
		current_user.current_cart = nil
		redirect_to cart_path(current_user.last_cart)
	end
	
	private
	
	
end
