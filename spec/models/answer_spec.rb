require 'rails_helper'

describe Answer do

  let!(:answer){ Answer.new(body: Faker::Lorem.paragraph)}

  it "is valid with body text" do
    expect(answer.save).to be true
  end

  it "is invalid without body text" do
    non_answer = Answer.create()
    expect(Answer.all).not_to include non_answer
  end

  it "can return the Question to which it belongs"

  it "can return the User to whom it belongs"

  it "can return all of its votes"

  it "can return a collection of its upvotes"

  it "can return a collection of its downvotes"

  it "can return a collection of its comments"

end
