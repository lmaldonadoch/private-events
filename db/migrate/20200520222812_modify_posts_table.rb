class ModifyPostsTable < ActiveRecord::Migration[6.0]
  def change
    remove_column :events, :name
    remove_column :events, :date
    add_column :events, :description, :string
    add_column :events, :date, :string
  end
end
