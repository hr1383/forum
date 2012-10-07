class DropLocationAndCreateLocations < ActiveRecord::Migration
  def up
    
    drop_table :location
    create_table :locations do |t|
      t.string :address
      t.string :category
      t.string :name
      t.string :postcode
      t.string :tel
    end  
  end

  def down
  end
end
