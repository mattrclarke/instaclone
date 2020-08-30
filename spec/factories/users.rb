FactoryBot.define do
  factory :user do
    email { Faker::Name }
    trait :with_profile do
      association :profile, :with_feed
    end
  end
end
