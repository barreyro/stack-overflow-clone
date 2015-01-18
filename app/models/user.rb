class User < ActiveRecord::Base
  has_secure_password
  validates :username, presence: true, uniqueness: true
  validates :email, presence: true, uniqueness: true
  validates_format_of :email, with: /@/
  validates :password, presence: true, length: { within: 6..20 }

  has_many :questions
  has_many :answers, through: :questions
  has_many :votes
  has_many :comments

  def self.session_user session_id
    User.find_by_id(session_id)
  end

  def current_user?
    self.id.eql? User.session_user.id
  end

  def questions_asked
    self.questions.count
  end

  def questions_answer
    self.answers.count
  end

  def has_questions?
    !self.questions.empty?
  end

  def memories
    self.questions.sample
  end

  def user_status
    infinity = (1.0 / 0.0)

    case self.reputation
    when (100..infinity)  then "Expert"
    when (50..99)         then "On Point"
    when (0..49)          then "Novice"
    when (-99..-1)        then "Bum"
    else                       "Dirty Troll"
    end
  end

  def reputation
    self.upvotes.count - self.downvotes.count
  end

  def upvotes
    question_votes = self.votes_on_all_questions.select { |vote| vote.upvote? }
    answer_votes = self.votes_on_all_answers.select { |vote| vote.downvote? }

    question_votes.concat(answer_votes)
  end

  def downvotes
    question_votes = self.votes_on_all_questions.select { |vote| vote.downvote? }
    answer_votes = self.votes_on_all_answers.select { |vote| vote.downvote? }

    question_votes.concat(answer_votes)
  end

  def votes_on_all_questions
    self.questions.map do |question|
      question.votes
    end.flatten
  end

  def votes_on_all_answers
    self.answers.map do |answer|
      answer.votes
    end.flatten
  end
end
