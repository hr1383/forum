class AddResolveVoxToPosts < ActiveRecord::Migration
  def change
    add_column :posts, :resolve_vox, :string
  end
end
