class ItemsController < ApplicationController
before_action :set_item, only: [:show]

private 
	def set_item
		Item.all.select {|item| item.inventory > 0 }
	end

end
