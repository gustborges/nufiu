class UpdateOtherForeignKey < ActiveRecord::Migration[6.0]
  def change
    # remove the old foreign_key
    remove_foreign_key :cart_plants, :plants
    remove_foreign_key :shippings, :users
    remove_foreign_key :cart_plants, :carts

    # add the new foreign_key
    add_foreign_key :cart_plants, :plants, on_delete: :cascade
    add_foreign_key :shippings, :users, on_delete: :cascade
    add_foreign_key :cart_plants, :carts, on_delete: :cascade
  end
end
