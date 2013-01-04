class AddItemsTable < ActiveRecord::Migration
  def change
    create_table :items do |t|
      t.string :name
      t.float :price
      t.string :photo
      t.timestamps
    end
  end
end