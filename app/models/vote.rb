class Vote < ActiveRecord::Base
  belongs_to :user
  belongs_to :post
  validates_presence_of :upvote
end
