class CreateUsers < ActiveRecord::Migration
  def change
    create_table :users do |t|
      t.integer :id
      t.string :firstname
      t.string :lastname
      t.string :emaild
      t.string :city
      t.string :country
      t.string :state
      t.date :dob
      t.boolean :isemailvalidated

      t.timestamps
    end
  end
end
