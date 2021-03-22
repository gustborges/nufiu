class AddColumnsToPlants < ActiveRecord::Migration[6.0]
  def change
    add_column :plants, :water_level, :integer
    add_column :plants, :water_text, :string
  end
end
