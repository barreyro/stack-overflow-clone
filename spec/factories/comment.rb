FactoryGirl.define do
  factory :comment do
    association :user
    body { Faker::Lorem.paragraph }
  end
end
