class RemoveColumnFromPlants < ActiveRecord::Migration[6.0]
  def change
    remove_column :plants, :low_light_tolerant, :boolean
    remove_column :plants, :for_beginners, :boolean
  end
end
