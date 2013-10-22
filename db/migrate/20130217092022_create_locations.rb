class CreateLocations < ActiveRecord::Migration
  def up
    create_table :locations do |t|
      t.references :post
      t.string :name
      t.string :address
      t.string :tel
      t.string :city
      t.string :category
      t.string :zipcode
      t.string :email
      t.string :website
      t.timestamps
    end

  end

  def down
  end
end
