class CreateItems < ActiveRecord::Migration
  def change
  	create_table :items do |t|
  		t.string :title
  		t.integer :category_id
  		t.integer :inventory, default: 0
  		t.integer :price
  	end
  end
end
