class User < ActiveRecord::Base
  has_secure_password
  validates :username, presence: true, uniqueness: true
  validates :email, presence: true, uniqueness: true
  validates_format_of :email, with: /@/
  validates :password, presence: true, length: { within: 6..20 }

  has_many :answers
  has_many :questions
  has_many :votes
  has_many :comments

  def self.session_user session_id
    User.find(session_id)
  end

  def current_user?
    self.id.eql? User.session_user.id
  end

  def questions_asked
    self.questions.count
  end

  def has_questions?
    true if !self.questions.empty?
  end

  def reputation
    self.upvote_count - self.downvote_count
  end

  def upvote_count
    (get_all_upvotes(self.questions) + get_all_upvotes(self.answers)) + (get_all_upvotes(self.answers) + get_all_upvotes(self.answers))
  end

  def downvote_count
    self.votes.where(upvote: false).count
  end

  def get_all_upvotes data_set
    data_set.each do |data|
      data.select { |vote| vote.upvote? }.count
    end
  end

  def get_all_downvotes data_set
    data_set.each do |data|
      data.select { |vote| vote.downvote? }.count
    end
  end
end
