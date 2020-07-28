class ChangeWaterColumnFromPlants < ActiveRecord::Migration[6.0]
  def change
    change_column :plants, :water, :string
  end
end
