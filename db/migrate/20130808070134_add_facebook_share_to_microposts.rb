class AddFacebookShareToMicroposts < ActiveRecord::Migration
  def change
    add_column :microposts, :facebook_share, :boolean, default: false
  end
end
