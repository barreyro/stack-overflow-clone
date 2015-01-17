require 'rails_helper'

describe Comment do

  it "is invalid without a body" do
    question = create(:question)
    note = Comment.new( )
    question.comments << note
    note.save
    expect(Comment.all).not_to include note
  end

  it "returns its owner as a User" do
    question = create(:question)
    note = build(:comment)
    question.comments << note
    question.save
    expect(note.user).to be_a User
  end

  it "can be made on a question" do
    question = create(:question)
    question.comments << build(:comment)
    question.save
    expect(question.comments.first).to be_a Comment
  end

  it "can be made on an answer" do
    answer = create(:answer)
    answer.comments << build(:comment)
    answer.save
    expect(answer.comments.first).to be_a Comment
  end

  it "can be made on a comment" do
    parent_comment = build(:comment)
    child_comment = Comment.new(body: "something")
    parent_comment.comments << child_comment
    parent_comment.save
    expect(parent_comment.comments.first == child_comment).to be(true)
    expect(child_comment.article == parent_comment).to be(true)
  end

  it "return a question when made on a question" do
    comment = create(:comment)
    expect(comment.question).to be_a Question
  end

  it "return an answer when made on an answer" do
    answer = create(:answer)
    comment = Comment.new(body: Faker::Lorem.word)
    answer.comments << comment
    comment.save
    expect(comment.answer).to be_a Answer
  end

  it "return a comment when made on a comment" do
    parent_comment = create(:comment)
    byebug
    comment = Comment.new(body:Faker::Lorem.word)
    parent_comment.comments << comment
    parent_comment.save
    expect(comment.comment).to be_a Comment
    expect(comment.question).to be nil
    expect(parent_comment.comments.first).to eq comment
  end

end
