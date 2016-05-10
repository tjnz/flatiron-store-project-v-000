class Cart < ActiveRecord::Base
	has_many :line_items
	has_many :items, :through => :line_items
	belongs_to :user
	
	
	def total
		line_items.inject(0){|sum, line_item| sum + (line_item.quantity * line_item.item.price)}
	end
	
	def printable_total
		self.total.to_f/100
	end
	
	def add_item(item_id)
		line_item = self.line_items.find_by(item_id: item_id)
		line_item = self.line_items.build(item_id: item_id) unless line_item		
		line_item.quantity += 1
		line_item.cart_id = self.id
		line_item
	end
	
	def checkout
		self.update(status: 'submitted')
		self.line_items.each do |line_item|
			line_item.item.inventory -= line_item.quantity
			line_item.item.save
		end
		user.remove_cart
	end
	
	def submitted?
		self.status == "submitted"
	end
	
end
