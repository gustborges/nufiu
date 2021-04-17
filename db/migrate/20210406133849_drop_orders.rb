class DropOrders < ActiveRecord::Migration[6.0]
  def up
    drop_table :orders
  end

  def down
    raise ActiveRecord::IrreversibleMigration
  end
end
