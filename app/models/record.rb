# FIXME: make stars int
class Record < ActiveRecord::Base
  attr_accessible :name, :content, :stars, :twitter_share, :facebook_share

  belongs_to :user
  
  validates :user_id, :name, :content, :stars, presence: true

  validates :content, length: { maximum: 300 }
  validates :stars, numericality: { only_integer: true, greater_than: 0, 
                                    less_than: 6 }
  
  default_scope order: 'records.created_at DESC'

  scope :from_users_followed_by, lambda { |user| followed_by(user) }

  private

    def self.followed_by(user)
      followed_user_ids = %(SELECT followed_id FROM relationships
                            WHERE follower_id = :user_id)
      where("user_id IN (#{followed_user_ids}) OR user_id = :user_id",
            { user_id: user })
    end
end
