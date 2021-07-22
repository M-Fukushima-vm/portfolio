module Jwt::UserAuthenticator
	extend self
  
  def call(request_headers)
    @request_headers = request_headers
    
    begin # 追加
      payload, _ = Jwt::TokenDecryptor.call(token)
      User.find(payload['user_id'])
    rescue StandardError # StandardError が起きた時
      nil
    end
  end
  
  private
  
  def token
    @request_headers['Authorization'].split(' ').last
  end
end