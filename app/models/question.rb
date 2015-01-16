class Question < ActiveRecord::Base
  belongs_to :user
  has_many   :answers
  has_many   :votes, as: :article
  has_many   :comments, as: :article
end
