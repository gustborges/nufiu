class RenameShippingFromSuburbs < ActiveRecord::Migration[6.0]
  def change
    rename_column :suburbs, :shipping, :shipping_price
  end
end
