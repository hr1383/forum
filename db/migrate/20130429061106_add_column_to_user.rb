class AddColumnToUser < ActiveRecord::Migration
  def up
    add_column :users, :subscribe, :boolean, :default=>:true
    add_column :users, :subscribe_token, :string
  end
end
