require 'rails_helper'

describe User do

  it "creates a user object when given valid attributes" do
    user = build(:user)
    expect(user).to be_valid
  end

  describe "Validations" do
    it "requires a username to save" do
      user = build(:user, username: "")
      expect(user.save).to be_falsey
    end

    it "requires an email to save" do
      user = build(:user, email: "")
      expect(user.save).to be_falsey
    end

    it "requires a password to save" do
      user = build(:user, password: "")
      expect(user.save).to be_falsey
    end

    it "requires an email to have an @ symbol" do
      user = build(:user, email: "emailgmail.com")

      expect(user.save).to be_falsey
    end

    it "requires a password to be between 6 and 20 characters" do
      short_password = build(:user, password: "abcd")
      long_password = build(:user, password: "abcdefghijklmnopqrstuvwxyz")

      expect(short_password.save).to be_falsey
      expect(long_password.save).to be_falsey
    end
  end

  describe "Class Methods" do
    it "has a method ::session_user that returns the session user" do
      user = create(:user)
      current_user = User.session_user(user.id)

      expect(current_user.id).to eq(user.id)
    end
  end

  describe "Methods" do
    before :each do
      @user = create(:user)
      @user_question = @user.questions.create({ title: "heyyy", body: "okayyyy" })
    end

    describe "#votes_on_all_questions" do
      before :each do
        10.times do
          question = @user.questions.create({ title: "Hi", body: "Well, hello there ;)" })
          5.times { question.votes.create({ user_id: rand(1..20), upvote: [true, false].sample }) }
        end
      end

      it "returns a collection of votes" do
        expect(@user.votes_on_all_questions.all? { |vote| vote.class.eql? Vote }).to be true
      end

      it "returns the corrent number of votes on a user's question" do
        expect(@user.votes_on_all_questions.count).to eq 50
      end
    end

    describe "#votes_on_all_answers" do
      before :each do
        10.times do
          answer = @user_question.answers.create({ body: "Hay thur, friendzs!"})
          5.times { answer.votes.create({ user_id: rand(1..20), upvote: [true, false].sample }) }
        end
      end

      it "returns a collection of votes" do
        expect(@user.votes_on_all_answers.all? { |vote| vote.class.eql? Vote }).to be true
      end

      it "returns the correct number of votes on an answer nested in a question" do
        expect(@user.votes_on_all_answers.count).to eq 50
      end
    end
  end

  describe "#upvotes and #downvotes and #reputation" do
    before :each do
      @user = create(:user)
      user_question = @user.questions.create({ title: "heyyy", body: "okayyyy" })

      @rand_num = rand(1..20)
      @rand_num.times do
        user_question.votes.create({ user_id: rand(1..20), upvote: true })
        user_question.votes.create({ user_id: rand(1..20), upvote: false })
      end
    end

    describe "#upvotes" do
      it "returns the correct number of upvotes" do
        expect(@user.upvotes.count).to eq @rand_num
      end

      it "returns a collection of upvotes" do
        upvotes = @user.upvotes

        expect(upvotes).to be_instance_of Array
        expect(
          upvotes.all? { |vote| vote.upvote? }
          ).to be true
      end
    end

    describe "#downvotes" do
      it "returns a collection of downvotes" do
        downvotes = @user.downvotes

        expect(downvotes).to be_instance_of Array
        expect(
          downvotes.all? { |vote| vote.downvote? }
          ).to be true
      end

      it "returns the correct number of downvotes" do
        expect(@user.downvotes.count).to eq @rand_num
      end
    end
  end
end
