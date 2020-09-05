FactoryBot.define do
  factory :card do
    title   { Faker::Lorem.word }
    memo    { Faker::Lorem.word }
    association :user
    association :list
  end
end