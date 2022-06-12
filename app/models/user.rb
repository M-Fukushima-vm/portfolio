class User < ApplicationRecord
  has_secure_password
  validates :name, presence: true
  validates :email, presence: true, uniqueness: true
  validates :password_digest, presence: true
  validates :avatar_name, uniqueness: true, length: {maximum: 3}

  has_one_base64_attached :avatar
end
