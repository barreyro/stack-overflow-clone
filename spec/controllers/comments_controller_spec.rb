require 'rails_helper'

describe CommentsController do

  describe "GET #index" do
    context "with params[:id] of parent article" do
      it "delivers an array of all the users comments" do
        user = create(:user)
        answer = create(:answer, user: user)
        comment = answer.comments.build( attributes_for(:comment, user_id: user.id) )
        comment.save
        get :index, {"answer" => {"id" => answer.id} }
        expect(assigns(:comments)).to match_array [comment]
      end
    end
  end

  describe "GET #show" do
    it "assigns the requested comment to @comment, and assigns the requested article to either @question or @answer"
    it "redirects to the article on which the comments was left"
  end

  describe "GET #new" do
    it "assigns a new Comment to @comment"
    it "renders the :new template"
  end

  describe "Post #create" do
    context "with valid attributes" do
      it "saves the new comment in the database"
      it 'redirects to comment#show'
    end

    context "with invalid attributes" do
      it "does not create the comment"
      it "render the :new template"
    end
  end

  describe "DELETE #destroy" do
    it "removes the comment from the database"
    it "redirects to user#show"
  end

end
