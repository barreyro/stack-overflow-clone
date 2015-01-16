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

  describe "GET #show" do
    it "assigns the user to @user" do
      user = create(:user)
      get :show, id: user
      expect(assigns(:user)).to eq user
    end

    it "renders the show template" do
      user = create(:user)
      get :show, id: user
      expect(response).to render_template :show
    end
  end

  describe "GET #edit" do
    it "assigns the user to @user" do
      user = create(:user)
      get :edit, id: user
      expect(assigns(:user)).to eq user
    end

    it "renders :edit template" do
      get :edit
      expect(response).to render_template :edit
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
      expect(response).to redirect_to new_user_path
    end

    it "saves to the database" do
      expect {
        post :create, user: attributes_for(:end_user)
      }.to change(User, :count).by(1)
    end
  end
end
