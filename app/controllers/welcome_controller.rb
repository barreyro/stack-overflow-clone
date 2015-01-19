class WelcomeController < ApplicationController
  def index
    @user = User.session_user(session[:user_id]) if session[:user_id]
    @questions = Question.all.page(params[:page]).per_page(5)
  end
end
