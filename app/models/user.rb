class User < ApplicationRecord
  before_save { self.email = email.downcase }

  validates :name, presence: true
  VALID_EMAIL_REGEX = /\A[\w+\-.]+@[a-z\d\-.]+\.[a-z]+\z/i # i：大文字小文字を無視
  validates :email, presence: true,
                    uniqueness: true,
                    format: { with: VALID_EMAIL_REGEX }
  VALID_PASSWORD_REGEX = /\A[\w\-]+\z/ #先頭から末尾まで、全て「a-zA-Z0-9_」と「-」にマッチする文字列を許容
  has_secure_password
  validates :password, presence: true,
                        length: { minimum: 4 },
                        format: {
                          with: VALID_PASSWORD_REGEX
                        },
                        allow_nil: true # 空パスワードのアップデートを許容

  validates :avatar_name, length: {maximum: 3}

  has_one_base64_attached :avatar
end
