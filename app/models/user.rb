class User < ApplicationRecord
  has_many :reviews

  before_save { self.email.downcase! }

  # VALIDATION
  VALID_EMAIL_REGEX = /\A[\w+\-.]+@[a-z\d\-.]+\.[a-z]+\z/i

  validates :username,
            presence: true,
            length: { maximum: 50, message: 'Too long yow' }

  validates :email,
            presence: true,
            length: { maximum: 50 },
            format: { with: VALID_EMAIL_REGEX },
            uniqueness: { case_sensitive: false }


  # FOR HASHING PASSWORD
  has_secure_password
end
