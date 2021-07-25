class Api::SessionsController < ApplicationController
  def create
    user = User.find_by(email: session_params[:email])
    # user が nilじゃない場合だけ、authenticateメソッドを実行
    if user&.authenticate(session_params[:password])
      # user.idから一意のuserを特定してtoken生成(token名でインスタンス化)
      token = Jwt::TokenProvider.call(user_id: user.id)
      # tokenのデータを追加したJSONを返す
      render json: ActiveModelSerializers::SerializableResource.new(user, serializer: UserSerializer).as_json.deep_merge(user: { token: token })
    else
      render json: { error: { messages: ['メールアドレスまたはパスワードに誤りがあります。'] } },
      status: :unauthorized
    end
  end

  private

  def session_params
    params.require(:session).permit(:email, :password)
  end
end
