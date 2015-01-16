FactoryGirl.define do
  factory :vote do

    factory :upvote do
      upvote true
    end

    factory :downvote do
      upvote false
    end

  end
end
