class AddForeignKeyToComment < ActiveRecord::Migration
  def change
    drop_table :comments
    create_table :comments do |t|
      t.references :umvoxq
      t.string :username
      t.integer :userId
      t.string :comment
      t.date :postDate

      t.timestamps
    end
  end
end
