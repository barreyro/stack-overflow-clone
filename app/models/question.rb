class Question < ActiveRecord::Base
  belongs_to :user
  has_many   :answers
  validates :title, presence: true
  validates :body,  presence: true
  has_many   :votes, as: :article
  has_many   :comments, as: :article
end
