class AddColumnToPlants < ActiveRecord::Migration[6.0]
  def change
    add_reference :plants, :light, foreign_key: true
  end
end
