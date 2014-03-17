class AlterTablePosts < ActiveRecord::Migration
  def up
    change_table :posts do |t|
      t.change :resolve_vox, :text
    end
  end

  def down
  end
end
