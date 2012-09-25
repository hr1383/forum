class AddRemoveColumnToUser < ActiveRecord::Migration
  def change
    remove_column :users,:fbId
    add_column :users,:fbid,:string
  end
end
