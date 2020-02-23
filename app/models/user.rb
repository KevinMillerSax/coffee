class User < ApplicationRecord
  has_many :conversations
  attr_accessor :remember_token

  validates :username, presence: true, uniqueness: true, length: { maximum: 20, minimum: 2 }
  validates :email, presence: true, uniqueness: { case_sensitive: false },
                    format: { with: URI::MailTo::EMAIL_REGEXP }
  has_secure_password
  validates :password, length: {minimum: 6}, allow_nil: true

  #return a hash digest of string
  def User.digest(string)
    cost = ActiveModel::SecurePassword.min_cost ? BCrypt::Engline::MIN_COST :
                                                  BCrypt::Engine.cost
    BCrypt::Password.create(string, cost: cost)
  end
  # returns a random token
  def User.new_token
    SecureRandom.urlsafe_base64
  end

  #remember a user in database for persistent sessions
  def remember
    self.remember_token = User.new_token
    update_attribute(:remember_digest, User.digest(remember_token))
  end

  def forget
    update_attribute(:remember_digest, nil)
  end

  def authenticated?(remember_token)
    if remember_digest.nil?
      false
    else
      BCrypt::Password.new(remember_digest).is_password?(remember_token)
    end
  end
end
