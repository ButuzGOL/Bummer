class Comment < ActiveRecord::Base
  attr_accessible :content

  belongs_to :discussion, counter_cache: true
end
