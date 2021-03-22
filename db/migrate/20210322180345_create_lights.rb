class CreateLights < ActiveRecord::Migration[6.0]
  def change
    create_table :lights do |t|
      t.string :level

      t.timestamps
    end
  end
end
