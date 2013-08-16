class CreateComments < ActiveRecord::Migration
  def change
    create_table :comments do |t|
      t.text :content
      t.integer :parent_id
      t.integer :discussion_id

      t.timestamps
    end

    add_index :comments, [:discussion_id, :created_at]
  end
end
