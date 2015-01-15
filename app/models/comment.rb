class Comment < ActiveRecord::Base
  validates_presence_of :user_id, :post_id, :body
  belongs_to :post
  belongs_to :user
end
