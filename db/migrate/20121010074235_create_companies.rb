class CreateCompanies < ActiveRecord::Migration
  def change
    create_table :companies do |t|
      t.references :post
      t.string :name
      t.string :address
      t.string :phonenumber
      t.string :city
      t.string :category
      t.string :zipcode
      t.string :email
      t.string :website
      t.timestamps
    end
  end
end
