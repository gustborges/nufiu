class AddWaterPeriodToPlants < ActiveRecord::Migration[6.0]
  def change
    add_reference :plants, :water_period, foreign_key: true
  end
end
