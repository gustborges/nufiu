class AddPickUpToShippings < ActiveRecord::Migration[6.0]
  def change
    add_column :shippings, :pick_up, :boolean, default: false
  end
end
