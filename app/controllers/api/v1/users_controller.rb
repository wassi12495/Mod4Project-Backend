class Api::V1::UsersController < ApplicationController


  def create
    user = User.create(username: params[:username], password: params[:password])

    render json: {username: user.username, id: user.id}

  end


end
