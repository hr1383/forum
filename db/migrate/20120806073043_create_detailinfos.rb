class CreateDetailinfos < ActiveRecord::Migration
  def change
     create_table :detailinfos do |t|
      t.references :post
      t.text :description
      t.timestamps
    end
  end
end
