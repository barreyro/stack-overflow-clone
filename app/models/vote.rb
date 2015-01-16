class Vote < ActiveRecord::Base
  belongs_to :user
  belongs_to :article, polymorphic: true
  validates_presence_of :upvote
end
