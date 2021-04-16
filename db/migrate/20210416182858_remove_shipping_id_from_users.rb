class RemoveShippingIdFromUsers < ActiveRecord::Migration[6.0]
  def change
    remove_reference :users, :shipping, null: false, foreign_key: true
  end
end
