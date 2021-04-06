class AddColumnsToUsers < ActiveRecord::Migration[6.0]
  def change
    add_column :users, :zip_code, :string
    add_column :users, :address_complement, :string
    add_column :users, :location_details, :string
    add_column :users, :suburb, :string
  end
end
