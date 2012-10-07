class RenameColumnComments < ActiveRecord::Migration
  def up
    
     drop_table :comments
    create_table :comments do |t|
      t.references :post
      t.string :username
      t.integer :userId
      t.string :comment
      t.date :postDate

      t.timestamps
    end
  end
  def down
  end
end
