class CartsController < ApplicationController

	def show
		render 'show', locals: {current_cart: @cart}
	end
	
	def checkout
	end
	
	private
	
	
end
