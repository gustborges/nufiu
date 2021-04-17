class RenameLights < ActiveRecord::Migration[6.0]
  def self.up
    rename_table :lights, :suns
  end

  def self.down
    rename_table :suns, :lights
  end
end
