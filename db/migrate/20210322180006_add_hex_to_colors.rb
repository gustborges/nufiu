class AddHexToColors < ActiveRecord::Migration[6.0]
  def change
    add_column :colors, :hex, :string
  end
end
