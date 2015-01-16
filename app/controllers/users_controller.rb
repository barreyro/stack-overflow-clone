class UsersController < ApplicationController
  def create
    user = User.new(user_params)

    if user.save!
      session[:user_id] = user.id
      redirect_to user_path(user.id)
    else
      redirect_to new_user_path
    end
  end

  def new
    @user = User.new
  end

  def edit
    @user = user.find(params[:id])
  end

  def show
    @user = User.find(params[:id])
  end

  private
    def user_params
      params.require(:user).permit(:username, :password)
    end
end
