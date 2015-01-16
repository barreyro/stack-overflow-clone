class Answer < ActiveRecord::Base
  validates_presence_of :body
  belongs_to :user
  belongs_to :question
  has_many :comments, as: :article
  has_many :votes, as: :article

  def upvotes
    votes.select{|v| v.upvote == true }
  end

  def downvotes
    votes.select{|v| v.upvote == false }
  end
end
