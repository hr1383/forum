class CreateComments < ActiveRecord::Migration
  def change
    create_table :comments do |t|
      t.integer :questionId
      t.string :username
      t.integer :userId
      t.string :comment
      t.date :postDate

      t.timestamps
    end
  end
end
