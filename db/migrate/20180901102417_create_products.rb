class CreateProducts < ActiveRecord::Migration[5.1]
  def change
    create_table :products do |t|
      t.column :name, :string
      t.column :brand, :string
      t.column :model, :string
      t.column :price, :string
      t.timestamps
    end
  end
end
