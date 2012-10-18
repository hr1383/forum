class DropColumnDetailinfo < ActiveRecord::Migration
  def up
    drop_table :detailinfos
    create_table :detailinfos do |t|
      t.references :post
      t.text :description
      t.timestamps
    end
  end

  def down
  end
end
