class Comment < ActiveRecord::Base
  validates_presence_of :user_id, :article_id, :body
  belongs_to :article, polymorphic: true
  belongs_to :user
  has_many :comments, as: :article
end
