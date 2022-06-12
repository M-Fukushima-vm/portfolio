module Jwt::TokenProvider
	extend self
  
  def call(payload)
    issue_token(payload) # ↓のprivateメソッド issue_token の実行
  end
  
  private
  
  def issue_token(payload)
    JWT.encode(payload, Rails.application.credentials.secret_key_base)
  end
  
end