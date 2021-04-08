class AddPublishedToPlants < ActiveRecord::Migration[6.0]
  def change
    add_column :plants, :published, :boolean
  end
end
