class CommentsController < ApplicationController
  #parent_article scoped
  def index
    @article = locals[:article]
    @comments = @article.comments
    render partial: "index"
  end

  def new
    @article = find_article
    @comment = @article.comments.build
    respond_to do |format|
      format.html {render partial: "new", locals: {comment: @comment} }
    end
  end

  def create
    @article = find_article
    @comment = @article.comments.build(comment_params )
    @comment.user_id = session[:user_id]
    respond_to do |format|
      if @comment.save
        @question = @comment.get_parent_question
        format.html { render partial: "show", locals: {comment: @comment} }
      else
        format.html {render partial: "new"}
      end
    end
  end

  #self-scoped
  def show
    render partial: "show"
  end

  def destroy
    comment = Comment.find(params[:id])
    @question = comment.get_parent_question
    if matches_current_user?(comment.user)
      comment.body = "[comment deleted by poster]"
      comment.save
    end
    redirect_to question_path(@question)
  end

  def edit
    @comment = Comment.find(params[:id])
  end

  def update
  end

  private

  def comment_params
    params.require(:comment).permit(:body)
  end

  def find_article
    resource, id = request.path.split("/")[1,2]
    @article = resource.singularize.classify.constantize.find(id)
  end

  def remove_id_anchor(key)
    sanitized = key.clone
    if sanitized.match(/_id$/)
      sanitized = key.sub(/_id$/, "")
    end
    sanitized
  end

end
