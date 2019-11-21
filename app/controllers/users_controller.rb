class UsersController < ApplicationController
 
  def create
    user = User.create(user_params) 
    if user.valid?
        payload = {user_id: user.id}
        token = JWT.encode(payload, 'my_s3cr3t')
        byebug
        render json: {user: user, jwt: token}
    else
        render json: {errors: user.errors.full_messages}, status: :not_acceptable
    end
  end

  def user_params
    params.permit(:username, :password)
  end
end

token = encode_token(payload)
