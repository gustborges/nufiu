class CreatePlants < ActiveRecord::Migration[6.0]
  def change
    create_table :plants do |t|
      t.string :name
      t.string :scientific_name
      t.string :category
      t.text :description
      t.integer :water
      t.boolean :pet_friendly
      t.boolean :low_light_tolerant
      t.boolean :best_seller
      t.boolean :for_beginners
      t.string :size

      t.timestamps
    end
  end
end
