module Jwt::TokenDecryptor
	extend self
  
  def call(token)
    decrypt(token)
  end
  
  private
  
  def decrypt(token)
    begin
      JWT.decode(token, Rails.application.credentials.secret_key_base)
    # エラーが起きた時のアクション
    rescue StandardError # StandardErrorが起きた時
      # 独自の InvalidTokenError を返す ↓↓↓
      raise InvalidTokenError
    end
  end
end
class InvalidTokenError < StandardError; end