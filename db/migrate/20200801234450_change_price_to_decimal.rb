class ChangePriceToDecimal < ActiveRecord::Migration[6.0]
  def change
    change_column :plants, :price, :decimal
  end
end
