FactoryBot.define do
  factory :book do
    title { Faker::Lorem.characters(5) }
    body { Faker::Lorem.characters(20) }
    user
  end
end