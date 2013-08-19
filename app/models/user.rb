# REVIEW: check string or text type
class User < ActiveRecord::Base
  
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable,
         :omniauthable, omniauth_providers: [:facebook, :twitter]

  attr_accessible :provider, :uid

  attr_accessor :login

  attr_accessible :email, :password, :password_confirmation, :remember_me, 
                  :username, :login, :location, :about, :website
  
  validates :username, presence: true, uniqueness: true

  validates :email, format: { with: Devise.email_regexp }, 
                    uniqueness: { case_sensitive: false }

  has_many :records, dependent: :destroy
  has_many :discussions, through: :records
  has_many :relationships, foreign_key: 'follower_id', dependent: :destroy
  has_many :followed_users, through: :relationships, source: :followed
  has_many :reverse_relationships, foreign_key: 'followed_id',
                                   class_name:  'Relationship',
                                   dependent:   :destroy
  has_many :followers, through: :reverse_relationships, source: :follower


  def self.find_first_by_auth_conditions(warden_conditions)
    conditions = warden_conditions.dup
    if login = conditions.delete(:login)
      where(conditions).where(["lower(username) = lower(:value) OR 
                                lower(email) = lower(:value)", 
                              { value: login.downcase }]).first
    else
      where(conditions).first
    end
  end

  def self.find_for_facebook_oauth(auth, signed_in_resource=nil)
    user = User.where(provider: auth.provider, uid: auth.uid).first
    
    unless user
      user = User.create(username: auth.extra.raw_info.username,
                         provider: auth.provider,
                         uid: auth.uid,
                         email: auth.info.email,
                         password: Devise.friendly_token[0, 20]
                         )
    end

    user
  end

  def self.find_for_twitter_oauth(auth, signed_in_resource=nil)
    user = User.where(provider: auth.provider, uid: auth.uid).first
    puts auth.to_yaml()
    unless user
      user = User.create(username: auth.extra.raw_info.name,
                         provider: auth.provider,
                         uid: auth.uid,
                         email: "twitter+#{auth.uid}@fake.com",
                         password: Devise.friendly_token[0, 20]
                         )
    end

    user
  end

  def records_feed
    Record.from_users_followed_by(self)
  end

  def following?(other_user)
    relationships.find_by_followed_id(other_user.id)
  end

  def follow!(other_user)
    relationships.create!(followed_id: other_user.id)
  end

  def unfollow!(other_user)
    relationships.find_by_followed_id(other_user.id).destroy
  end

end