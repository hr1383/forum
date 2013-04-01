class ChangeColumnPost < ActiveRecord::Migration
  def up
    change_table :posts do |t|
      t.change :description, :text
    end
  end

  def down
  end
end
