class CreateCarts < ActiveRecord::Migration[5.1]
  def change
    create_table :carts do |t|
    	t.column :item_id, :string
    	t.column :quantity, :integer
    	t.column :item_total, :integer
      	t.timestamps
    end
  end
end
