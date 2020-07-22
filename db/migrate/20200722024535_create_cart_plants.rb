class CreateCartPlants < ActiveRecord::Migration[6.0]
  def change
    create_table :cart_plants do |t|
      t.references :cart, null: false, foreign_key: true
      t.references :plant, null: false, foreign_key: true
      t.integer :amount

      t.timestamps
    end
  end
end
