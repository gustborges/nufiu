class RemoveColumnsFromCarts < ActiveRecord::Migration[6.0]
  def change
    remove_column :carts, :total, :integer
    remove_column :carts, :status, :string
  end
end
