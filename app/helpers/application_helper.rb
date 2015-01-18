module ApplicationHelper
  def get_current_user
    User.session_user session[:user_id]
  end

  def matches_current_user?(user)
    get_current_user == user
  end

  def format_errors(invalid_obj)
    if invalid_obj.errors
      messages = []
      invalid_obj.errors.each do |key, val|
        title = key.to_s.sub(/(_id$)|(id$)/, "")
        messages << "#{title.to_s} error: #{val}"
      end
    end
    messages
  end
end
