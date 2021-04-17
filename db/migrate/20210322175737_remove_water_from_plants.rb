class RemoveWaterFromPlants < ActiveRecord::Migration[6.0]
  def change
    remove_column :plants, :water, :string
  end
end
