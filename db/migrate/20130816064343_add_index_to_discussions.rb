class AddIndexToDiscussions < ActiveRecord::Migration
  def change
    add_index :discussions, :record_id
  end
end
