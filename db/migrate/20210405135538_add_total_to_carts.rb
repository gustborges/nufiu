class AddTotalToCarts < ActiveRecord::Migration[6.0]
  def change
    add_column :carts, :total, :integer
  end
end
