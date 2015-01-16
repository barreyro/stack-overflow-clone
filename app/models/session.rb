class Session < ActiveRecord::Base
  def self.login_by_username_or_email user_input
    return User.find_by(email: user_input) if user_input.match /^.+@.+$/
    User.find_by(username: user_input)
  end
end
