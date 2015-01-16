require 'rails_helper'

describe Answer do

  let!(:answer){ create(:answer)}

  it "is valid with body text" do
    expect(answer.save).to be true
  end

  it "is invalid without body text" do
    non_answer = Answer.create()
    expect(Answer.all).not_to include non_answer
  end

  it "can return the Question to which it belongs" do
    expect(answer.question).to be_a Question
  end

  it "can return the User to whom it belongs" do
    expect(answer.user).to be_a User
  end

  it "can return all of its votes" do
    up = create(:upvote)
    answer.votes << up
    expect(answer.votes).to include up
  end

  it "can return a collection of its upvotes" do
    up = create(:upvote)
    answer.votes << up
    expect(answer.upvotes.all?{|v| v.upvote == true }).to be true
  end

  it "can return a collection of its downvotes" do
    down = create(:downvote)
    answer.votes << down
    expect(answer.downvotes.all?{|v| v.upvote == false }).to be true
  end

  it "can return a collection of its comments" do
    comment = Comment.create(body:"This is a great answer")
    answer.comments << comment
    expect(answer.comments).to include comment
  end

end
