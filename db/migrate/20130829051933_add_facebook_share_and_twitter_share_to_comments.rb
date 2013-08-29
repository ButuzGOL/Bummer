class AddFacebookShareAndTwitterShareToComments < ActiveRecord::Migration
  def change
    add_column :comments, :facebook_share, :boolean, default: false
    add_column :comments, :twitter_share, :boolean, default: false
  end
end
