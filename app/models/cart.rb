class Cart < ActiveRecord::Base
	has_many :line_items
	has_many :items, :through => :line_items
	belongs_to :user
	
	
	def total
	end
	
	def add_item(item_id)
		
	end
	
	
	
end
