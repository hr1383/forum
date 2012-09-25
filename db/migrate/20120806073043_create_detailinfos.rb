class CreateDetailinfos < ActiveRecord::Migration
  def change
    create_table :detailinfos do |t|
      t.references :post
      t.string :accountnumber
      t.string :referencenumber
      t.text :description

      t.timestamps
    end
  end
end
