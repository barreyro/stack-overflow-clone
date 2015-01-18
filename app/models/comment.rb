class Comment < ActiveRecord::Base
  validates_presence_of :user_id, :article_id, :body
  belongs_to :article, polymorphic: true
  belongs_to :user
  has_many :comments, as: :article


  def get_parent
    question || answer || comment
  end

  def get_parent_question
    return article if article.class == Question
    return article.question if article.class == Answer
    article.get_parent_question
  end

  private

  def question
    return self.article if article.class == Question
    nil
  end

  def answer
    return article if article.class == Answer
    nil
  end

  def comment
    return article if article.class == Comment
    nil
  end
end
