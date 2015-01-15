class Answer < ActiveRecord::Base
  validates_presence_of :body
  belongs_to :user, :question
  has_many :comments, :votes

  def upvotes
    votes.select{|v| v.upvote == true }
  end

  def downvotes
    votes.select{|v| v.downvote == true }
  end
end
