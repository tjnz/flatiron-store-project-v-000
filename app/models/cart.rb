class Cart < ActiveRecord::Base
	has_many :line_items
	has_many :items, :through => :line_items
	belongs_to :user
	
	
	def total
		line_items.inject(0){|sum, line_item| sum + (line_item.quantity * line_item.item.price)}
	end
	
	def add_item(item_id)
		line_item = LineItem.find_or_initialize_by(item_id: item_id)
		line_item.quantity += 1
		line_item.cart_id = self.id
		line_item
	end
	
	
	
end
