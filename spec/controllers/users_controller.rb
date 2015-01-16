require 'rails_helper'

describe UsersController do
  describe "GET #new" do
    it "assigns a User to @user" do
      get :new
      expect(assigns(user)).to be_a_new(User)
    end
  end
end
