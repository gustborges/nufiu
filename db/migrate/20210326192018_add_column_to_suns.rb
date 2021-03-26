class AddColumnToSuns < ActiveRecord::Migration[6.0]
  def change
    add_column :suns, :amount, :string
  end
end
