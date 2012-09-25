class AddcolumnToUserFbId < ActiveRecord::Migration
  def up
        add_column :users,:fbId,:string
  end

  def down
  end
end
