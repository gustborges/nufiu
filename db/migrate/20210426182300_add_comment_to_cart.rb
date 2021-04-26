class AddCommentToCart < ActiveRecord::Migration[6.0]
  def change
    add_column :carts, :comment, :text
  end
end
