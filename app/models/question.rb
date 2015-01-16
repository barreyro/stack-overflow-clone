class Question < ActiveRecord::Base
  belongs_to :user
  has_many   :answers
  has_many   :votes, as: :article
  has_many   :comments, as: :article
  validates :title, presence: true
  validates :body,  presence: true
end
