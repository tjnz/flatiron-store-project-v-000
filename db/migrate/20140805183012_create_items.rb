class CreateItems < ActiveRecord::Migration
  def change
  	create_table :items do |t|
  		t.string :title
  		t.integer :category_id
  		t.integer :inventory, default: 0
  		t.decimal :price, :precision => 8, :scale => 2
  	end
  end
end
