require 'rails_helper'

describe Session do
  before :each do
    @user = create(:user)
  end

  describe "has a method ::login_by_username_or_email" do
    it "returns a User when given a correct email" do
      expect(Session.login_by_username_or_email(@user.email)).to be_a User
    end

    it "returns a User when given a correct username" do
      expect(Session.login_by_username_or_email(@user.username)).to be_a User
    end

    it "will not return User when given incorrect information" do
      expect(Session.login_by_username_or_email("1759alvklua02861knce")).to be_falsey
    end
  end
end
