class CreateComments < ActiveRecord::Migration
  def change
    create_table :comments do |t|
      t.references :post
      t.string :username
      t.integer :userId
      t.string :comment
      t.string :name
      t.string :email
      t.string :comment_type,:default=>'comment'
      t.boolean :is_backer
      t.date :postDate

      t.timestamps
    end
  end
     
end
