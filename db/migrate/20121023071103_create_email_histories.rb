class CreateEmailHistories < ActiveRecord::Migration
  def change
    create_table :email_histories do |t|
      t.integer :id
      t.integer :postid
      t.integer :emailstatid
      t.datetime :lastsent
      t.timestamps
    end
  end
end
