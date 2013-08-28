class Discussion < ActiveRecord::Base
  attr_accessible :content, :twitter_share, :facebook_share, :record_id

  belongs_to :record
  has_many :comments, dependent: :destroy

  default_scope order: 'discussions.created_at DESC'

  def discussing
    discussing = comments.all.collect(&:user)
    if !discussing.include? record.user
      discussing.unshift record.user
    end
    discussing
  end
end
