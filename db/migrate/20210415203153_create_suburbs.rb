class CreateSuburbs < ActiveRecord::Migration[6.0]
  def change
    create_table :suburbs do |t|
      t.string :name
      t.integer :shipping

      t.timestamps
    end
  end
end
