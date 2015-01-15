require 'rails_helper'

describe Question do
  it "is valid with a user_id, title, and body"
  it "is invalid without a user_id"
  it "is invalid without a title"
  it "is invalid without a body"
  it "is valid with duplicate user_id"
  it "returns a title as a string"
end
