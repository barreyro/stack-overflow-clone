require 'rails_helper'

describe SessionsController do
  describe "GET #login" do
    it "renders the login template" do
      get :login
      expect(response).to be_success
    end
  end

  # describe "GET #create_session" do
  #   it "finds the correct user before authenticating" do
  #     get :create_session
  #     expect(assigns(:user)).to be_a_new(User)
  #   end
  # end
end
