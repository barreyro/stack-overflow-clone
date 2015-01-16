require 'rails_helper'
describe QuestionsController do
  let(:user) { FactoryGirl.create :user }
  let(:question) { FactoryGirl.create :question }
  context "GET #index" do
    it "assigns a questions variable to Question.all" do
      get :index
      expect(response).to be_success
    end
  end
  context "GET #new" do
    it "assigns a questiono variable to Question.new" do
      get :new
      expect(assigns(:question)).to be_a_new Question
    end
  end
end

