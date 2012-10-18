class AddColumEmailStat < ActiveRecord::Migration
  def up
    add_column :email_stats,:call,:bool
  end

  def down
  end
end
