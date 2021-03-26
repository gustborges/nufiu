class RenameColumnFromPlants < ActiveRecord::Migration[6.0]
   def self.up
    rename_column :plants, :light_id, :sun_id
  end

  def self.down
    rename_column :plants, :sun_id, :light_id
  end
end
