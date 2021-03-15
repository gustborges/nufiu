class RemoveCategoryFromPlants < ActiveRecord::Migration[6.0]
  def change
    remove_column :plants, :category, :string
  end
end
