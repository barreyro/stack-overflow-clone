class Vote < ActiveRecord::Base
  belongs_to :user
  belongs_to :article, polymorphic: true
  validates :upvote, inclusion: { in: [true, false] }
end
