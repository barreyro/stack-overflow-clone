require 'rails_helper'

describe User do

  it "creates a user object when given valid attributes" do
    user = build(:user)
    expect(user).to be_valid
  end

  describe "Validations" do
    it "requires a username to save" do
      user = build(:user, username: "")
      expect(user.save).to be_falsey
    end

    it "requires an email to save" do
      user = build(:user, email: "")
      expect(user.save).to be_falsey
    end

    it "requires a password to save" do
      user = build(:user, password: "")
      expect(user.save).to be_falsey
    end

    it "requires an email to have an @ symbol" do
      user = build(:user, email: "emailgmail.com")

      expect(user.save).to be_falsey
    end

    it "requires a password to be between 6 and 20 characters" do
      short_password = build(:user, password: "abcd")
      long_password = build(:user, password: "abcdefghijklmnopqrstuvwxyz")

      expect(short_password.save).to be_falsey
      expect(long_password.save).to be_falsey
    end
  end

  describe "Class Methods" do
    it "has a method ::session_user that returns the session user" do
      user = create(:user)
      current_user = User.session_user(user.id)

      expect(current_user.id).to eq(user.id)
    end
  end
end
