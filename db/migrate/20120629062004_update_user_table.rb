class UpdateUserTable < ActiveRecord::Migration
  def up
    remove_column :users, :token,:isemailvalidated
  end

  def down
  end
end
