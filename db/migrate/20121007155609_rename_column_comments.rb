class RenameColumnComments < ActiveRecord::Migration
  def up
    
     remove_column :comments,:questionId
    add_column :comments,:post_id,:integer
  end

  def down
  end
end
