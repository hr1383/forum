class RenameColumnnComment < ActiveRecord::Migration
  def up
    remove_column :comments, :type
    add_column :comments,:comment_type,:string,:default=>'comment'
  end

  def down
  end
end
