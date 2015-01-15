require 'rails_helper'

describe Vote do
  let(:upvote){ Vote.new(upvote:true)}
  let(:downvote){ Vote.new(downvote:true)}

  it "is invalid if it is note defined as an up or downvote" do
    non_vote = Vote.new
    non_vote.save
    expect(Vote.all).not_to include non_vote
  end

  it "is either an upvote or a downvote" do
    expect(upvote.upvote?).to be true
    expect(downvote.upvote?).to be false
    expect(downvote.downvote?).to be true
  end

  it "can belong to a Question" do
    question = Question.create(title:"sample")
    question << upvote
  end

  it "can belong to an Answer" do

  end

end
