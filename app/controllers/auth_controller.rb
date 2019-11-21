class AuthController < ApplicationController
  def login
    user = User.find_by(username: params[:username])
    if user && user.authenticate(params[:password])
        payload = {user_id: user.id}
        token = encode_token(payload)
        render json: {user: user, jwt: token, success: "Welcome back, #{user.username}"}
    else
        render json: {failure: "Log in failed! Username or password invalid!"}
    end
  end

  def auto_login

  end

  def user_is_authed

  end
end
