class CreateWaterPeriods < ActiveRecord::Migration[6.0]
  def change
    create_table :water_periods do |t|
      t.string :amount

      t.timestamps
    end
  end
end
