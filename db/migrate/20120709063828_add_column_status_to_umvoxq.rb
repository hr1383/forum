class AddColumnStatusToUmvoxq < ActiveRecord::Migration
  def change
    add_column :umvoxqs,:status,:string
  end
end
