class AddShippingToUsers < ActiveRecord::Migration[6.0]
  def change
    add_reference :users, :shipping, foreign_key: true
  end
end
