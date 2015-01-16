require 'rails_helper'

describe AnswersController do
  describe "GET #new" do
    it "assigns an Answer to @answer" do
      get :new
      expect(response).to be_success
    end

    # it "renders :new template" do
    #   get :new
    #   expect(response).to render_template :new
    # end
  end

  # describe "GET #show" do
  #   it "assigns the answer to @answer" do
  #     answer = create(:answer)
  #     get :show, id: answer
  #     expect(assigns(:answer)).to eq answer
  #   end

  #   it "renders the show template" do
  #     answer = create(:answer)
  #     get :show, id: answer
  #     expect(response).to render_template :show
  #   end
  # end

  # describe "GET #edit" do
  #   it "assigns the answer to @answer" do
  #     answer = create(:answer)
  #     get :edit, id: answer
  #     expect(assigns(:answer)).to eq answer
  #   end

  #   it "renders :edit template" do
  #     answer = create(:answer)
  #     get :edit, id: answer
  #     expect(response).to render_template :edit
  #   end
  # end

  # describe "POST #create" do
  #   it "redirects to root_path if answer created" do
  #     post :create, answer: attributes_for(:end_answer)
  #     expect(response).to redirect_to root_path
  #   end

  #   it "assigns a session answer when answer created" do
  #     answer = attributes_for(:end_answer)
  #     post :create, answer: answer
  #     expect(Answer.find_by(answername: answer[:answername]).id).to eq(session[:answer_id])
  #   end

  #   it "redirects back to signup form if signup fails" do
  #     post :create, answer: attributes_for(:invalid_answer)
  #     expect(response).to redirect_to new_answer_path
  #   end

  #   it "saves to the database" do
  #     expect {
  #       post :create, answer: attributes_for(:end_answer)
  #     }.to change(Answer, :count).by(1)
  #   end
  # end

  # describe "PUT #update" do
  #   before :each do
  #     @answer = create(:answer)
  #   end

  #   describe "when passed valid attributes" do
  #     it "updates the answer's attributes" do
  #       patch :update, id: @answer,
  #         answer: attributes_for(:answer, answername: "jdawg55")
  #         @answer.reload
  #         expect(@answer.answername).to eq('jdawg55')
  #     end
  #     it "redirects to updated answer" do
  #       patch :update, id: @answer, answer: attributes_for(:answer, answername: "jdawg55")
  #       @answer.reload
  #       expect(response).to redirect_to @answer
  #     end
  #   end

  #   describe "when passed invalid attributes" do
  #     it "does not update the answer's attributes" do
  #       answername = @answer.answername
  #       patch :update, id: @answer,
  #         answer: attributes_for(:answer, answername: "")
  #         @answer.reload
  #         expect(@answer.answername).to_not eq("''")
  #         expect(@answer.answername).to eq(answername)
  #     end

  #     it "redirects to the edit_answer_path" do
  #       patch :update, id: @answer,
  #         answer: attributes_for(:invalid_answer)
  #         expect(response).to redirect_to edit_answer_path
  #     end
  #   end

  #   describe "sets flash parameters" do
  #     it "on success to 'Profile Update.'" do
  #       patch :update, id: @answer, answer: attributes_for(:answer, answername: "jdawg55")
  #       expect(flash[:success]).to eq("Profile Updated.")
  #     end
  #     it "on failure to 'Update Unsuccessful.'" do
  #       patch :update, id: @answer,
  #       answer: attributes_for(:answer, answername: "")
  #       expect(flash[:failure]).to eq("Update Unsuccessful.")
  #     end
  #   end
  # end
end
