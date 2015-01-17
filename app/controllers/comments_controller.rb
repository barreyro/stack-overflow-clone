class CommentsController < ApplicationController
  #parent_article scoped
  def index
    @article = locals[:article]
    @comments = @article.comments
    render partial: "index"
  end

  def new
    @article = find_parent_with_type
    @comment = @article.comments << Comment.new
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

  def find_parent_with_type
    params.each do |key, value|
      #hacky temporary fix
      next unless !!( /(question)|(comment)|(answer|id)/ =~ key )

      klass = key.sub(/_id$/, "")
      if klass.classify.constantize
        return klass.classify.constantize.find(value)
      end
    end
    nil
  end

  def parent_show_path(article_obj)
    if article_obj.class == Question
      "/questions/#{article_obj.id}"
    elsif article_obj.class == Answer
      "/questions/#{article_obj.question.id}/answers/#{article_obj.id}"
    else
      root_path
    end
  end

end
