class UserEmailUniqueIndex < ActiveRecord::Migration
  def up
    remove_index :users, :email
    add_index :users, :email, :unique => true
  end

  def down
  end
end
