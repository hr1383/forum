class AddColumnToUser < ActiveRecord::Migration
  def up
    add_column :users, :subscribe, :boolean, :default=>1
    add_column :users, :subscribe_token, :string
  end
end
