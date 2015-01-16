class WelcomeController < ApplicationController
  def index
    if session[:user_id]
      @user = User.session_user(session[:user_id])
    end
  end
end
