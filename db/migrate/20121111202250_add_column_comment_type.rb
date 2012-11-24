class AddColumnCommentType < ActiveRecord::Migration
  def up
    add_column :comments,:type,:string,:default=>'comment'
  end

  def down
  end
end
