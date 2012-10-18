class AddColumnUser < ActiveRecord::Migration
  def up
    add_column :users,:email_count,:int,:default =>10
    add_column :users,:admin,:bool
  end

  def down
  end
end
