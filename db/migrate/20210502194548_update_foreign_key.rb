class UpdateForeignKey < ActiveRecord::Migration[6.0]
  def change
    # remove the old foreign_key
    remove_foreign_key :carts, :users

    # add the new foreign_key
    add_foreign_key :carts, :users, on_delete: :cascade
  end
end
