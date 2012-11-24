class AddColumnComments < ActiveRecord::Migration
  def up
     add_column :comments,:is_backer,:boolean
  end

  def down
  end
end
