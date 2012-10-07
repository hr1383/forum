class CreateCompanyEmails < ActiveRecord::Migration
  def change
    create_table :company_emails do |t|
      t.string :name
      t.string :email

      t.timestamps
    end
  end
end
