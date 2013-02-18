class CreatePosts < ActiveRecord::Migration
  def change
    create_table :posts do |t|
      t.references :user
      t.string :posttype
      t.string :status
      t.string :question
      t.string :description
      t.string :address
      t.string :scenario
      t.string :compensation

      t.timestamps
    end
  end
end
