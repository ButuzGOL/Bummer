class UsersRollbackEmailField < ActiveRecord::Migration
  def up
    remove_column :users, :email
    add_column :users, :email, :string, null: false, default: ''
    add_index :users, :email, unique: true
  end

  def down
  end
end
