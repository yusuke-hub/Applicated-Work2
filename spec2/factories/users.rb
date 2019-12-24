FactoryBot.define do
  factory :user do
    name { Faker::Lorem.characters(10) }
    email { Faker::Internet.email }
    introduction { Faker::Lorem.characters(20) }
    password { 'password' }
    password_confirmation { 'password' }
  end
end