FactoryBot.define do
  factory :user do
    email {"a@a.com" }
    trait :with_profile do
      association :profile, :with_feed
    end
  end
end
