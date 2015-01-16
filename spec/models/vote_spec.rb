require 'rails_helper'

describe Vote do
  let(:upv){ create(:upvote)}
  let(:downv){ create(:downvote)}

  it "is invalid if it is note defined as an up or downvote" do
    non_vote = Vote.new
    non_vote.save
    expect(Vote.all).not_to include non_vote
  end

  it "is either an upvote or a downvote" do
    expect(upv.upvote?).to be true
    expect(downv.upvote?).to be false
    expect(downv.downvote?).to be true
  end

  it "can belong to a Question" do
    question = create(:question)
    question.votes << upv
    expect(question.votes).to include upv
  end

  it "can belong to an Answer" do
    answer = create(:answer)
    answer.votes << downv
    expect(answer.votes).to include downv
  end

end
