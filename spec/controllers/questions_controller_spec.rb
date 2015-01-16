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
end

