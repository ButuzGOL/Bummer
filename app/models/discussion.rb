class Discussion < ActiveRecord::Base
  attr_accessible :content, :twitter_share, :facebook_share, :record_id

  belongs_to :record
  has_many :comments, dependent: :destroy

  default_scope order: 'discussions.created_at DESC'

  def discussing
    # OPTIMIZE: make another way 
    discussing = comments.all.collect(&:user).uniq
    if !discussing.include? record.user
      discussing.unshift record.user
    end
    discussing
  end

  def self.search(query)
    find(:all, conditions: ['content LIKE ?', "%#{query}%"])
  end

end
