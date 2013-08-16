class RenameTableMicropostToRecord < ActiveRecord::Migration
  def up
    rename_table :microposts, :records
  end

  def down
  end
end
