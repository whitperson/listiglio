class AddUseridToItemsTable < ActiveRecord::Migration
  def change
    add_column :items, :user_id, :integer
    change_column :items, :price, :string
  end
end