FactoryGirl.define do
  factory :question do
    title {Faker::Lorem.word}
    body  {Faker::Lorem.paragraph}

    after(:build) do |question|
      u = FactoryGirl.build(:user)
      u.questions << question
    end
  end
end
