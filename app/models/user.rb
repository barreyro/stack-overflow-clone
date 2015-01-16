class User < ActiveRecord::Base
  has_secure_password
  validates :username, presence: true, uniqueness: true
  validates :email, presence: true, uniqueness: true
  validates_format_of :email, with: /@/
  validates :password, presence: true, length: { within: 6..20 }

  has_many :answers
  has_many :questions
  has_many :votes

  def self.session_user session_id
    User.find(session_id)
  end

  def current_user?
    self.id.eql? User.session_user.id
  end
end
