class User < ActiveRecord::Base
  
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable,
         :omniauthable, omniauth_providers: [:facebook, :twitter]

  attr_accessible :provider, :uid

  attr_accessor :login

  attr_accessible :email, :password, :password_confirmation, :remember_me, 
                  :username, :login
  
  validates :username, presence: true, uniqueness: true

  validates :email, format: { with: Devise.email_regexp }, 
                    uniqueness: { case_sensitive: false }
  
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

end