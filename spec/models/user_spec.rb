require 'rails_helper'

describe User do
  it "creates a user object when given valid attributes" do
    user = FactoryGirl.build(:user)
    expect(user).to be_instance_of(User)
  end

  it "requires a username to save" do
    user = FactoryGirl.build(:user, username: "")
    expect(user.save).to be_falsey
  end

  it "requires an email to save" do
    user = FactoryGirl.build(:user, email: "")
    expect(user.save).to be_falsey
  end

end
