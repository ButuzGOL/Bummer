class RemoveOldIndexsFromRecords < ActiveRecord::Migration
  def up
    remove_index :records, name: 'index_microposts_on_user_id_and_created_at'
    add_index :records, [:user_id, :created_at]
  end

  def down
  end
end
