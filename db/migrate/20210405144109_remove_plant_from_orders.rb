class RemovePlantFromOrders < ActiveRecord::Migration[6.0]
  def change
    remove_reference :orders, :plant, null: false, foreign_key: true
  end
end
