# TODO: try this gem https://github.com/elight/acts_as_commentable_with_threading
class Comment < ActiveRecord::Base
  attr_accessible :content

  belongs_to :discussion, counter_cache: true
end
