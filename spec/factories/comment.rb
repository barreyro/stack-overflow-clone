FactoryGirl.define do
  factory :comment do
    association :user
    body { Faker::Lorem.paragraph }

    after(:build) do |comment|
      question = create(:question)
      question.comments << comment
    end

  end
end
