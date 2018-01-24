class Api::V1::UsersController < ApplicationController


  def create
    user = User.find_by(username: params[:username])

    if user && user.authenticate(params[:password])
      render json: {username: user.username, id: user.id}
    else
      render json: {error: 'User information is not authenticated'}, status: 401
    end
  end


end
