require 'rails_helper'

describe User do
  it "requires a username" do
    FactoryGirl.build(:user, username: "").should_not be_valid
  end

end
