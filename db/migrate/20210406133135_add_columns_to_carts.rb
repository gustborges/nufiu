class AddColumnsToCarts < ActiveRecord::Migration[6.0]
  def change
    add_column :carts, :amount, :integer
    add_column :carts, :checkout_session_id, :string
    add_column :carts, :state, :string
    add_column :carts, :plant_sku, :string
  end
end
