class User < ApplicationRecord
  has_secure_password
  validates :password, length: { minimum: 6 }

  validates :username, length: { minimum: 4 }
  validates_uniqueness_of :username

  validates_format_of :email,
                      with: /\A([^@\s]+)@((?:[-a-z0-9]+\.)+[a-z]{2,})\z/i
  validates_uniqueness_of :email
end
