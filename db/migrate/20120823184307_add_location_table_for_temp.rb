class AddLocationTableForTemp < ActiveRecord::Migration
  def up
    create_table :location do |t|
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
