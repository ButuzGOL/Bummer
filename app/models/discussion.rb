class Discussion < ActiveRecord::Base
  attr_accessible :content

  belongs_to :record
  has_many :comments, dependent: :destroy

  default_scope order: 'discussions.created_at DESC'
end
