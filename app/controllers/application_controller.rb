class ApplicationController < ActionController::Base
  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
  protect_from_forgery with: :exception
  before_filter :current_cart
	
	def current_cart
	 	@cart = current_user.try(:current_cart) || nil
	end

end
