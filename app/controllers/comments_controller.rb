class CommentsController < ApplicationController
  #parent_article scoped
  def index
    @article = find_parent
    @comments = @article.comments
    render partial: "index"
  end

  def new
  end

  def create
  end

  #self-scoped
  def show
  end

  def destroy
  end

  def edit
  end

  def update
  end

  private

  def find_parent
    params.each do |klass, value|
      if klass.classify.constantize
        return klass.classify.constantize.find(value[:id])
      end
    end
    nil
  end

end
