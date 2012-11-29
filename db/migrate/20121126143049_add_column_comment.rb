class AddColumnComment < ActiveRecord::Migration
  def up
    add_column :comments, :name, :string
    add_column :comments, :email, :string
  end

  def down
  end
end
