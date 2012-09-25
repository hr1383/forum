class AddColumnCategoryToUmvox < ActiveRecord::Migration
  def change
    add_column :umvoxqs,:category,:string
  end
end
