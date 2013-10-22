class AddColumnPost < ActiveRecord::Migration
  def up
        add_column :posts, :parameterize, :string
        add_index :posts, :parameterize
  end

  def down
    remove_column :posts, :parameterize
  end
end
