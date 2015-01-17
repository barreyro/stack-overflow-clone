require 'rails_helper'
describe QuestionsController do
  let(:user) { FactoryGirl.create :user }
  let(:quesiton) { FactoryGirl.create :question }

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
  context "POST #create" do
    it "creates a question if params are valid" do
      expect{
        post :create, question: {
          title: "Can you name all the CareBears?",
          body: "I only know of Sunshine Bear."
        }
      }.to change { Question.count }.by(1)
    end
  end

  context "GET #edit" do
    it "assigns the request title to appropriate question" do
      question = create(:question)
      get :edit, id: question.id
      expect(assigns(:question)).to eq question
    end

    it "renders the :edit template" do
      question = create(:question)
      get :edit, id: question.id
      expect(response).to render_template :edit
    end
  end


end

