class AddPriceToPlants < ActiveRecord::Migration[6.0]
  def change
    add_column :plants, :price, :float
  end
end
