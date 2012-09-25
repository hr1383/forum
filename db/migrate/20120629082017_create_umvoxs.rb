class CreateUmvoxs < ActiveRecord::Migration
  def change
    create_table :umvoxs do |t|
      t.integer :user_id
      t.string :question
      t.string :description
      t.string :company
      t.string :address
      t.string :scenario
      t.string :compensation

      t.timestamps
    end
  end
end
