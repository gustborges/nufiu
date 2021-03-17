class CreatePlantColors < ActiveRecord::Migration[6.0]
  def change
    create_table :plant_colors do |t|
      t.references :plant, null: false, foreign_key: true
      t.references :color, null: false, foreign_key: true

      t.timestamps
    end
  end
end
