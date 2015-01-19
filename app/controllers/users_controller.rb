class UsersController < ApplicationController
  def create
    user = User.new(user_params)

    if user.save
      session[:user_id] = user.id
      redirect_to root_path
    else
      flash[:failure] = "Login Failed."
      redirect_to new_user_path
    end
  end

  def new
    @user = User.new
  end

  def edit
    @user = User.find(params[:id])
  end

  def update
    user = User.find(params[:id])
    if user.update(user_params)
      flash[:success] = "Profile Updated."
      redirect_to user_path(user.id)
    else
      flash[:failure] = "Update Unsuccessful."
      redirect_to edit_user_path(user.id)
    end
  end

  def show
    @user = User.find_by_id(params[:id])
    if @user
      @memories = @user.memories
      @questions = Question.where(user_id: @user.id).page(params[:page]).per_page(1)
    else
      redirect_to root_path
    end
  end

  def destroy
    session[:user_id] = nil
    User.find(params[:id]).destroy
    redirect_to root_path
  end

  private
    def user_params
      params.require(:user).permit(:username, :password, :email)
    end
end
