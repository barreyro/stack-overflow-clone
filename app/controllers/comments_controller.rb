class CommentsController < ApplicationController
  #parent_article scoped
  def index
    @article = find_parent
    @comments = @article.comments
    render partial: "index"
  end

  def new
    @article = find_parent
    @comment = Comment.new
  end

  def create
    @article = find_parent
    @comment = @article.comments.build(params[:comment])
    if @comment.save
      flash[:notice] = "Commented!"
      redirect_to parent_show_path
    else
      flash[:notice] = "Comment creation error: #{@comment.errors}"
      render :new
    end
  end

  #self-scoped
  def show
    @article = find_parent
    @comments = @article.comments
    render partial: "show"
  end

  def destroy
  end

  def edit
  end

  def update
  end

  private

  def find_parent
    params.each do |key, value|
      klass = key.sub( /_id$/, "" )
      if klass.classify.constantize
        return klass.classify.constantize.find(value[:id])
      end
    end
    nil
  end

  def parent_show_path(article_obj)
    "/#{article_obj.class.downcase}s/#{article_obj.id}"
  end

end
