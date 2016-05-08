class Item < ActiveRecord::Base
	belongs_to :category
	has_many :line_items
	
	def self.available_items
		self.all.collect {|item| item.inventory > 0}
	end
end
