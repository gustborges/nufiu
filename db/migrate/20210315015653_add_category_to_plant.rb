class AddCategoryToPlant < ActiveRecord::Migration[6.0]
  def change
    add_reference :plants, :category, foreign_key: true
  end
end
