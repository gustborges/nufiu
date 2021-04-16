class CreateShippings < ActiveRecord::Migration[6.0]
  def change
    create_table :shippings do |t|
      t.string :address
      t.string :address_complement
      t.string :zip_code
      t.references :suburb, foreign_key: true
      t.string :location_details

      t.timestamps
    end
  end
end
