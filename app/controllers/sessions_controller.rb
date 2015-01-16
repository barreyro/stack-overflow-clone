class SessionsController < ApplicationController

  def login
  end

  def create_session
    user = User.find_by(username: params[:username])

    if user && user.authenticate(params[:password])
      session[:user_id] = user.id
      flash[:success] = "Welcome back, #{user.username}!"
      redirect_to root_path
    else
      flash[:failure] = "Login Failed."
      redirect_to login_path
    end
  end

  def logout
    session[:user_id] = nil

    redirect_to root_path
  end
end
