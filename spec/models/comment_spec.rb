describe Comment do

  it "is invalid without a body" do
    note = build(:comment)
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

end
