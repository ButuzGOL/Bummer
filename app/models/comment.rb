# TODO: try this gem https://github.com/elight/acts_as_commentable_with_threading
# TODO: put validation in models
class Comment < ActiveRecord::Base
  attr_accessible :content, :twitter_share, :facebook_share, :user_id

  belongs_to :discussion, counter_cache: true
  belongs_to :user
end
