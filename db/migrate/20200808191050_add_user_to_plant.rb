class AddUserToPlant < ActiveRecord::Migration[6.0]
  def change
    add_reference :plants, :user, foreign_key: true
  end
end
