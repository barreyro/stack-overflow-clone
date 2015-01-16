require 'rails_helper'

describe Question do
  let(:test_user) {FactoryGirl.create :user}
  it "is valid with a title and body" do
    question = Question.new(
      title: 'What does bear meat taste like?',
      body: 'Black or care bears only.')
    expect(question).to be_valid
  end

  it "is invalid without title" do
    question = Question.new(title: nil)
    expect(Question.all).not_to include question
  end

  it "is invalid without body" do
    question = Question.new(body: nil)
    expect(Question.all).not_to include question
  end

  it "returns a title as a string" do
    question = Question.new(
      title: 'What does bear meat taste like?',
      body: 'Black or care bears only.')
    expect(question.title).to eq(question.title.to_s)
  end

  it "has a user_id" do
    question = Question.new(
      title: "What does bear meat taste like?",
      body: 'Black or care bears only.',
      user_id: test_user.id)
    expect(question.user_id).to be_truthy
  end
end
