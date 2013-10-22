class CreateUpdatestatuses < ActiveRecord::Migration
  def change
    create_table :updatestatuses do |t|
      t.references :post
      t.string :status

      t.timestamps
    end
  end
end
