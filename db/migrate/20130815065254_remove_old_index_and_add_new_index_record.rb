class RemoveOldIndexAndAddNewIndexRecord < ActiveRecord::Migration
  def up
    remove_index :records, [:user_id, :created_at]
    add_index :records, [:user_id, :created_at]
  end

  def down
  end
end
