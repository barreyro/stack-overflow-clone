module ApplicationHelper
  def get_current_user
    User.session_user session[:user_id]
  end

  def matches_current_user?(user)
    get_current_user == user
  end
end
