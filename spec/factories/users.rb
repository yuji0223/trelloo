FactoryBot.define do
  factory :user do
    password = Faker::Internet.password(min_length: 4, max_length: 8)
    name                  { Faker::Internet.username}
    email                 { Faker::Internet.free_email}
    password              { password }
    password_confirmation { password }
  end
end