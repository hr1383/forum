class DropColumnUserEmaild < ActiveRecord::Migration
  def up
    remove_column :users,:emaild
  end

  def down
  end
end
