class CreateEmailStats < ActiveRecord::Migration
  def change
    create_table :email_stats do |t|
      t.integer :postId
      t.integer :counter
      t.boolean :call
      t.datetime :lastsent

      t.timestamps
    end
  end
end
