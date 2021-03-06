require 'rails_helper'

describe SessionsController do
  before :each do
    @user = create(:user)
  end

  describe "GET #login" do
    it "renders the login template" do
      get :login
      expect(response).to be_success
    end
  end

  describe "GET #create_session" do
    it "sets the correct session user after authenticating" do
    end

    it "redirects to root_path when given incorrect information" do
      bad_user = User.new(username: "", password: "", email: "")
      get :create_session, username: bad_user
      expect(response).to redirect_to login_path
    end

    # describe "sets flash parameters" do
    #   it "on success to welcome specific user" do
    #     get :create_session, { user_input: @user.username }
    #     expect(flash[:success]).to eq("Welcome back, #{@user.username}!")
    #   end
    # end
  end

  describe "GET #logout" do
    before :each do
      session[:user_id] = @user.id
    end

    it "removes the user id from session user_id" do
      get :logout
      expect(session[:user_id]).to be nil
    end

    it "redirects to the root_path" do
      get :logout
      expect(response).to redirect_to root_path
    end
  end
end
