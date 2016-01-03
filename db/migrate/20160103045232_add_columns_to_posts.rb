class AddColumnsToPosts < ActiveRecord::Migration
  def change
    add_column :posts, :click_count, :integer, default: 0
    add_column :posts, :category, :string
  end
end
