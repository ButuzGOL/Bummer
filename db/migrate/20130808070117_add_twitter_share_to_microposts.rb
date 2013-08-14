class AddTwitterShareToMicroposts < ActiveRecord::Migration
  def change
    add_column :microposts, :twitter_share, :boolean, default: false
  end
end
