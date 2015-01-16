FactoryGirl.define do
  factory :answer do
    body Faker::Lorem.paragraph

    after(:build) do |answer|
      user = create(:user)
      user.answers << answer
      query = create(:question)
      query.answers << answer
    end

  end
end
