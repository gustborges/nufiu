class ChangeDataTypeForPlants < ActiveRecord::Migration[6.0]
  def change
    change_column :plants, :price, :integer
  end
end
