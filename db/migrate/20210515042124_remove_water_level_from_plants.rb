class RemoveWaterLevelFromPlants < ActiveRecord::Migration[6.0]
  def change
    remove_column :plants, :water_level, :integer
  end
end
