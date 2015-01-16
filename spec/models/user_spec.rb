require 'rails_helper'

describe User do

  it "creates a user object when given valid attributes" do
    user = FactoryGirl.build(:user)
    expect(user).to be_valid
  end

  describe "Validations" do
    it "requires a username to save" do
      user = FactoryGirl.build(:user, username: "")
      expect(user.save).to be_falsey
    end

    it "requires an email to save" do
      user = FactoryGirl.build(:user, email: "")
      expect(user.save).to be_falsey
    end

    it "requires a password to save" do
      user = FactoryGirl.build(:user, password: "")
      expect(user.save).to be_falsey
    end
  end

  describe "Class Methods" do
    it "has a method ::session_user that returns the session user" do
      user = FactoryGirl.create(:user)
      current_user = User.session_user(user.id)

      expect(current_user.id).to eq(user.id)
    end
  end

end
