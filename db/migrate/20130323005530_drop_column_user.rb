class DropColumnUser < ActiveRecord::Migration
  def up
    remove_column :users, :admin
    add_column :users, :admin , :boolean
  end

  def down
  end
end
