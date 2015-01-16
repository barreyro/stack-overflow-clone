class Vote < ActiveRecord::Base
  belongs_to :user
  belongs_to :article, polymorphic: true
  validates :upvote, inclusion: { in: [true, false] }

  def upvote?
    upvote
  end

  def downvote?
    !upvote
  end

end
