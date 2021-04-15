class AddColumnToUsers < ActiveRecord::Migration[6.0]
  def change
    add_reference :users, :suburb, foreign_key: true
  end
end
