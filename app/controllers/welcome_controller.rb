class WelcomeController < ApplicationController
  def index
    @user = User.session_user(session[:user_id]) if session[:user_id]
  end
end
