class User < ApplicationRecord
  validates :username, presence: true, uniqueness: true, length: { maximum: 20, minimum: 2 }
  validates :email, presence: true, uniqueness: { case_sensitive: false },
                    format: { with: URI::MailTo::EMAIL_REGEXP }
  has_secure_password

end
