class CreateUsers < ActiveRecord::Migration
  def change
    create_table :users do |t|
      t.integer :id
      t.string :firstname
      t.string :lastname
      t.string :username
      t.string :city
      t.string :country
      t.string :state
      t.integer :email_count,:default =>10
      t.boolean :admin
      t.string :fbid
      t.timestamps
    end
  end
end
