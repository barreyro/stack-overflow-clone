class SessionsController < ApplicationController

  def login
  end

  def create_session
    User.find_by(username: params[:username])

    if user && user.authenticate(params[:password])
      session[:user_id] = user.id

      redirect_to login_path
    else
      redirect_to login_path
    end
  end

  def logout
    session[:user_id] = nil

    redirect_to root_path
  end
end
