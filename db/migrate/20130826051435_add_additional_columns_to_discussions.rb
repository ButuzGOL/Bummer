class AddAdditionalColumnsToDiscussions < ActiveRecord::Migration
  def change
    add_column :discussions, :twitter_share, :boolean, default: false
    add_column :discussions, :facebook_share, :boolean, default: false
  end
end
