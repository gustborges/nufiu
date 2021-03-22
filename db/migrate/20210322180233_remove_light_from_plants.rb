class RemoveLightFromPlants < ActiveRecord::Migration[6.0]
  def change
    remove_column :plants, :light, :string
  end
end
