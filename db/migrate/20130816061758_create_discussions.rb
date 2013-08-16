class CreateDiscussions < ActiveRecord::Migration
  def change
    create_table :discussions do |t|
      t.text :content
      t.integer :record_id

      t.timestamps
    end
  end
end
