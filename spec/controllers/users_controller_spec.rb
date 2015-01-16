require 'rails_helper'

describe UsersController do
  describe "GET #new" do
    it "assigns a User to @user" do
      get :new
      expect(response).to be_success
    end

    it "renders :new template" do
      get :new
      expect(response).to render_template :new
    end
  end

  describe "POST #create" do
    it "redirects to root_path if user created" do
      post :create, user: attributes_for(:end_user)
      expect(response).to redirect_to root_path
    end

    it "assigns a session user when user created" do
      user = attributes_for(:end_user)
      post :create, user: user
      expect(User.find_by(username: user[:username]).id).to eq(session[:user_id])
    end

    it "redirects back to signup form if signup fails" do
      post :create, user: attributes_for(:invalid_user)
      expect(response).to redirect_to root_path
    end
  end
end
