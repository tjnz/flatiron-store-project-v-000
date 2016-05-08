class CreateLineItems < ActiveRecord::Migration
  def change
  	create_table :line_items do |t|
  		t.integer :quantity
  	end
  end
end
